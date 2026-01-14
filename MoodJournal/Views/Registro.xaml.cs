using Firebase.Auth;
using Google.Cloud.Firestore;
using System;
using Microsoft.Maui.Controls;
#if ANDROID
using Plugin.CloudFirestore;
#endif

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
            catch (Exception ex)
            {
                // Usamos reflexión para obtener el nombre del tipo de error sin invocar la clase conflictiva
                string errorType = ex.GetType().Name;
                string msg = "Ocurrió un error inesperado.";

                if (errorType.Contains("FirebaseAuthException"))
                {
                    // Como no podemos usar el 'switch' con AuthErrorReason por el conflicto, 
                    // buscamos palabras clave en el mensaje de error o simplemente damos un aviso general
                    string errorDetail = ex.Message.ToLower();

                    if (errorDetail.Contains("email_exists"))
                        msg = "Este email ya está registrado.";
                    else if (errorDetail.Contains("weak_password"))
                        msg = "La contraseña debe tener al menos 6 caracteres.";
                    else if (errorDetail.Contains("invalid_email"))
                        msg = "El formato del email no es válido.";
                    else
                        msg = "Error de autenticación: " + ex.Message;
                }
                else
                {
                    msg = "Error: " + ex.Message;
                }

                await DisplayAlert("Error de Registro", msg, "OK");
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