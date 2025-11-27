using Firebase.Auth; // Reemplaza con el namespace de tu SDK de Auth
using Google.Cloud.Firestore; // <-- AÑADIDO: Para la base de datos Firestore
using System;
using Microsoft.Maui.Controls;
using MoodJournal.Views; // Ajusta este namespace si tu MainPage está en otra carpeta/namespace

namespace MoodJournal
{
    public partial class Registro : ContentPage 
    {
        // 1. Declarar las variables de solo lectura
        private readonly FirebaseAuthClient _firebaseAuthClient;
        private readonly FirestoreDb _firestoreDb;

        // 2. Constructor: .NET MAUI inyecta automáticamente las instancias
        //    que registraste como Singleton en MauiProgram.cs.
        public Registro(FirebaseAuthClient authClient, FirestoreDb firestoreDb)
        {
            InitializeComponent();

            // 3. Asignar las instancias inyectadas a tus variables privadas
            _firebaseAuthClient = authClient;
            _firestoreDb = firestoreDb;
        }

      

        // Método para registrar al usuario
        private async void OnRegisterButtonClicked(object sender, EventArgs e)
        {
            // 1. OBTENER DATOS DE LA UI (Entry)
            string name = edit_text_name.Text?.Trim();
            string email = edit_text_email.Text?.Trim();
            string password = edit_text_password.Text; // No trim() para contraseñas

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                await DisplayAlert("Faltan datos", "Por favor, complete todos los campos.", "OK");
                return;
            }

            try
            {
                // 2. CREAR CUENTA con Firebase Authentication
                UserCredential userCredential =
                    await _firebaseAuthClient.CreateUserWithEmailAndPasswordAsync(email, password);

                string userId = userCredential.User.Uid;

                // 3. GUARDAR DATOS ADICIONALES en Firestore
                var userData = new Dictionary<string, object>
                {
                    { "nombre_usuario", name },
                    { "email", email },
                    { "fecha_registro", DateTime.UtcNow } // Usamos DateTime.UtcNow para el Timestamp
                };

                // Establecer el documento en la colección 'usuarios' usando el UID como ID del documento
                DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(userId);
                await docRef.SetAsync(userData);

                await DisplayAlert("¡Bienvenido!", $"Registro exitoso para {name}.", "OK");

                // 4. NAVEGACIÓN post-registro
                // Navegar a la página principal del diario (Home/MainPage) y limpiar la pila de navegación
                await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
            }
            catch (FirebaseAuthException authEx)
            {
                // Manejo de errores específicos de Auth (ej: email-already-in-use, weak-password)

                // NOTA: Usamos el enum AuthErrorReason, no un string.
                string msg = authEx.Reason switch
                {
                    // El tipo de authEx.Reason es AuthErrorReason
                    AuthErrorReason.EmailExists => "Este email ya está registrado.",
                    AuthErrorReason.WeakPassword => "La contraseña debe tener al menos 6 caracteres.",
                    AuthErrorReason.InvalidEmailAddress => "El formato del email no es válido.",

                    // El caso por defecto maneja cualquier otro error
                    _ => "Error de autenticación: " + authEx.Message
                };

                await DisplayAlert("Error de Registro", msg, "OK");
            }
        }

        // Método llamado cuando el usuario toca "ya tengo una cuenta" (Navegación correcta)
        private async void OnAlreadyAccountTapped(object sender, TappedEventArgs e)
        {
            // Vuelve a la página anterior (que asumimos es el Login o Bienvenida)
            await Navigation.PopAsync();

            // Dejando un comentario para poder hacer commit

        }
    }
}