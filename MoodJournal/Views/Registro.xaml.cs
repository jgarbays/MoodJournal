using Firebase.Auth;
using Google.Cloud.Firestore;
using System;
using Microsoft.Maui.Controls;

namespace MoodJournal
{
    public partial class Registro : ContentPage
    {
        // 1. Variables de solo lectura para los servicios
        private readonly FirebaseAuthClient _firebaseAuthClient;
        private readonly FirestoreDb _firestoreDb;

        // 2. Constructor con Inyección de Dependencias
        public Registro(FirebaseAuthClient authClient, FirestoreDb firestoreDb)
        {
            InitializeComponent();
            _firebaseAuthClient = authClient;
            _firestoreDb = firestoreDb;
        }

        // Método para el botón de Registro
        private async void OnRegisterButtonClicked(object sender, EventArgs e)
        {
            // Obtener y limpiar datos de los Entry
            string name = edit_text_name.Text?.Trim();
            string email = edit_text_email.Text?.Trim();
            string password = edit_text_password.Text;

            // Validación básica
            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                await DisplayAlert("Faltan datos", "Por favor, complete todos los campos.", "OK");
                return;
            }

            try
            {
                // 3. Crear el usuario en Firebase Authentication
                UserCredential userCredential = await _firebaseAuthClient.CreateUserWithEmailAndPasswordAsync(email, password);
                string userId = userCredential.User.Uid;

                // 4. Guardar el nombre y otros datos en Firestore
                // La Home leerá el nombre directamente de este diccionario.
                var userData = new Dictionary<string, object>
{
    { "nombre_usuario", name },
    { "email", email },
    { "telefono", "" }, 
    { "fecha_nacimiento", "" },
    { "fecha_registro", DateTime.UtcNow }
};

                DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(userId);
                await docRef.SetAsync(userData);

                await DisplayAlert("¡Hola!", $"Registro exitoso para {name}.", "OK");

                // 5. Navegar a la Home (Usando // para limpiar el historial)
                await Shell.Current.GoToAsync("//Home");
            }
            catch (FirebaseAuthException authEx)
            {
                // Manejo de errores amigable según el motivo de Firebase
                string msg = authEx.Reason switch
                {
                    AuthErrorReason.EmailExists => "Este email ya está registrado.",
                    AuthErrorReason.WeakPassword => "La contraseña debe tener al menos 6 caracteres.",
                    AuthErrorReason.InvalidEmailAddress => "El formato del email no es válido.",
                    _ => "Error de autenticación: " + authEx.Message
                };

                await DisplayAlert("Error de Registro", msg, "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "Ocurrió un error inesperado: " + ex.Message, "OK");
            }
        }

        // Método para el label "Ya tengo una cuenta"
        private async void OnAlreadyAccountTapped(object sender, TappedEventArgs e)
        {
            // Usamos Shell para volver a la página de Login de forma segura
            await Shell.Current.GoToAsync("//MainPage");
        }
    }
}