using Microsoft.Extensions.Logging;
using Firebase.Auth;
using Firebase.Auth.Providers;
using Google.Cloud.Firestore; // <-- AÑADIDO: Para la base de datos Firestore
using MoodJournal.Views;      // <-- AÑADIDO: Asumiendo que las vistas están aquí

namespace MoodJournal
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            // ==========================================================
            // CONFIGURACIÓN DE FIREBASE (AUTH & FIRESTORE)
            // ==========================================================

            // Define las constantes de tu proyecto
            const string apiKey = "AIzaSyA521Rlu3USNVPRZMAVJY40bCQH6eNha8E";
            const string projectId = "moodjournal-e3dff"; // ID del Proyecto Firebase
            const string authDomain = "moodjournal-e3dff.firebaseapp.com";

            // 1. REGISTRO de FirebaseAuthClient (Singleton)
            // Esto permite que cualquier constructor pida FirebaseAuthClient.
            builder.Services.AddSingleton(new FirebaseAuthClient(new FirebaseAuthConfig()
            {
                ApiKey = apiKey,
                AuthDomain = authDomain,
                Providers = [new EmailProvider()]
            }));

            // 2. REGISTRO de FirestoreDb (Singleton)
            // Esto usa Google.Cloud.Firestore y necesita el Project ID.
            builder.Services.AddSingleton(FirestoreDb.Create(projectId));

            // 3. REGISTRO de Páginas para Inyección de Dependencias
            // Esto permite que el constructor de la página Registro reciba las instancias de Firebase.
            builder.Services.AddTransient<Registro>();
            builder.Services.AddTransient<MoodJournal.Views.Home>();
            builder.Services.AddTransient<MoodJournal.Views.MainPage>();


            // ==========================================================

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}