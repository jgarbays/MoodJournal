using Microsoft.Extensions.Logging;
using Firebase.Auth;
using Firebase.Auth.Providers;
using Google.Cloud.Firestore;
using Plugin.LocalNotification;
using Microcharts.Maui;


namespace MoodJournal
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMicrocharts()
              
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            // ==========================================================
            // CONFIGURACIÓN DE FIREBASE (AUTH & FIRESTORE)
            // ==========================================================

            // Define las constantes del proyecto
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

            // 2. REGISTRO de FirestoreDb
            builder.Services.AddSingleton<FirestoreDb>(sp =>
            {
                try
                {
                    // En Android, Firestore suele requerir que el SDK de Firebase esté listo
                    // Si no tienes el archivo de credenciales JSON de cuenta de servicio,
                    // esta librería de Google Cloud puede fallar en móvil.
                    return FirestoreDb.Create(projectId);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error creando Firestore: {ex.Message}");
                    return null; // Evita que la app explote al arrancar
                }
            });



            builder.Services.AddSingleton<INotificationService>(sp => LocalNotificationCenter.Current);

            // 3. REGISTRO de Páginas para Inyección de Dependencias
            // Esto permite que el constructor de la página Registro reciba las instancias de Firebase.
            builder.Services.AddTransient<Registro>();
            builder.Services.AddTransient<MoodJournal.Views.Home>();
            builder.Services.AddTransient<MoodJournal.Views.MainPage>();
            builder.Services.AddTransient<MoodJournal.Views.Estadisticas>();
            builder.Services.AddTransient<MoodJournal.Views.Calendario>();
            builder.Services.AddTransient<MoodJournal.Views.Ajustes>();


            // ==========================================================

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}