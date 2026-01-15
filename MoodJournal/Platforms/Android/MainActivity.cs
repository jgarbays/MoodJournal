using Android.App;
using Android.Content.PM;
using Android.OS;
using Firebase; // SDK Nativo

namespace MoodJournal;

[Activity(Theme = "@style/Maui.MainTheme", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
public class MainActivity : MauiAppCompatActivity
{
    protected override void OnCreate(Bundle? savedInstanceState)
    {
        // 1. La inicialización de Firebase debe ir ANTES del base.OnCreate
        // Pero es buena práctica verificar si ya está inicializado para evitar excepciones
        if (FirebaseApp.Instance == null)
        {
            FirebaseApp.InitializeApp(this);
        }

        base.OnCreate(savedInstanceState);
    }
}