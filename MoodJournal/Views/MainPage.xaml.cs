using Firebase.Auth;
using Microsoft.Maui.Controls;
using System;
using System.Threading.Tasks;
using MoodJournal.Views; // Si Home y Registro están aquí
using Google.Cloud.Firestore; // Aunque no se usa en login, se mantiene si lo necesitas después
using Microsoft.Extensions.DependencyInjection; // Necesario para GetService si mantienes esa opción
using Firebase.Auth.Providers; // Necesario si manejas AuthErrorReason
using Firebase;
#if ANDROID
using Plugin.CloudFirestore;
#endif


namespace MoodJournal.Views
{
    public partial class MainPage : ContentPage
    {
        // 1. Declarar la variable de solo lectura para la autenticación
        private readonly FirebaseAuthClient _firebaseAuthClient;

        // 2. Constructor con Inyección de Dependencias (necesario para login)
        // Mainpage debe ser registrado como Transient/Singleton en MauiProgram.cs para esto
        public MainPage(FirebaseAuthClient authClient)
        {
            try { 
            InitializeComponent();
            _firebaseAuthClient = authClient;
            }
            catch (Exception ex) {
            // Esto obligará a que el error aparezca en una ventana emergente
                System.Diagnostics.Debug.WriteLine($"🛑 ERROR CRÍTICO: {ex.Message}");
            }
        }



        // ==========================================================
        // LÓGICA DE INICIO DE SESIÓN (Login)
        // ==========================================================
        // Asegúrate de tener este nombre para el CheckBox en tu XAML: x:Name="chk_remember"

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            // 1. COMPROBAR SI "RECORDARME" ESTABA ACTIVO
            bool recordar = Preferences.Default.Get("remember_me", false);

            if (recordar)
            {
                chk_remember.IsChecked = true;

                // Cargar email (de Preferences) y contraseña (de SecureStorage)
                email_input.Text = Preferences.Default.Get("user_email", string.Empty);

                string savedPassword = await SecureStorage.Default.GetAsync("user_password");
                password_input.Text = savedPassword ?? string.Empty;
            }
        }

        private async void OnLoginButtonClicked(object sender, EventArgs e)
        {
            string email = email_input.Text?.Trim();
            string password = password_input.Text;

            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                await DisplayAlert("Datos Incompletos", "Por favor, ingrese su email y contraseña.", "OK");
                return;
            }

            try
            {
                UserCredential userCredential = await _firebaseAuthClient.SignInWithEmailAndPasswordAsync(email, password);

                // ==========================================================
                // LÓGICA DE "RECORDARME" (Justo antes de navegar)
                // ==========================================================
                if (chk_remember.IsChecked)
                {
                    // Guardamos el email y el estado del checkbox
                    Preferences.Default.Set("user_email", email);
                    Preferences.Default.Set("remember_me", true);

                    // Guardamos la contraseña de forma segura y encriptada
                    await SecureStorage.Default.SetAsync("user_password", password);
                }
                else
                {
                    // Si el usuario desmarcó la casilla, borramos lo guardado
                    Preferences.Default.Remove("user_email");
                    Preferences.Default.Set("remember_me", false);
                    SecureStorage.Default.Remove("user_password");
                }
                // ==========================================================

                await DisplayAlert("Éxito", $"¡Hola de nuevo!", "OK");
                await Shell.Current.GoToAsync("//Home");
            }
            catch (Exception ex)
            {
                string msg = "Ocurrió un error inesperado.";

                // 1. Detectamos si es un error de Firebase por su nombre (como texto)
                if (ex.GetType().Name.Contains("FirebaseAuthException"))
                {
                    // 2. Buscamos palabras clave dentro del mensaje de error
                    string errorDetail = ex.Message.ToLower();

                    if (errorDetail.Contains("user_not_found") || errorDetail.Contains("invalid_user"))
                        msg = "No existe una cuenta con este email.";
                    else if (errorDetail.Contains("wrong_password"))
                        msg = "Contraseña incorrecta. Inténtelo de nuevo.";
                    else if (errorDetail.Contains("invalid_email"))
                        msg = "El formato del email es incorrecto.";
                    else
                        msg = "Error de acceso: " + ex.Message;
                }
                else
                {
                    msg = "Error: " + ex.Message;
                }

                await DisplayAlert("Error de Acceso", msg, "OK");
            }
        }

        // ==========================================================
        // NAVEGACIÓN AL REGISTRO (Tapped)
        // ==========================================================
        private async void OnRegisterTapped(object sender, TappedEventArgs e)
        {
         
            await Shell.Current.GoToAsync(nameof(Registro));

            
        }


    }
}