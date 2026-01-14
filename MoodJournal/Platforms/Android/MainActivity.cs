using Android.App;
using Android.Content.PM;
using Android.OS;
using Firebase; // Asegúrate de tener el NuGet Xamarin.Firebase.Common

namespace MoodJournal;

[Activity(Theme = "@style/Maui.MainTheme", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
public class MainActivity : MauiAppCompatActivity
{
    protected override void OnCreate(Bundle? savedInstanceState)
    {
        // Esta es la pieza que falta para que el APK de Release no se cierre
        FirebaseApp.InitializeApp(this);
        base.OnCreate(savedInstanceState);
    }
}