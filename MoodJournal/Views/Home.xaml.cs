using Firebase.Auth;
using Google.Cloud.Firestore;
using MoodJournal.Views;

// Añadimos el namespace para Android
#if ANDROID
using Plugin.CloudFirestore;
#endif

namespace MoodJournal.Views;

public partial class Home : ContentPage
{
    private readonly FirebaseAuthClient _authClient;
    private readonly FirestoreDb _firestoreDb;

    // 1. EL CAMBIO VITAL: Añadimos "= null" al final de FirestoreDb
    public Home(FirebaseAuthClient authClient, FirestoreDb firestoreDb = null)
    {
        InitializeComponent();
        _authClient = authClient;
        _firestoreDb = firestoreDb;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await CargarNombreUsuario();
    }

    private async Task CargarNombreUsuario()
    {
        try
        {
            var user = _authClient.User;
            if (user != null)
            {
                string nombre = string.Empty;

                // 2. LÓGICA HÍBRIDA PARA LEER DATOS
#if ANDROID
                // Uso del Plugin nativo para Android
                var snapshot = await Plugin.CloudFirestore.CrossCloudFirestore.Current.Instance
                                   .Collection("usuarios")
                                   .Document(user.Uid)
                                   .GetAsync();

                if (snapshot.Exists)
                {
                    // En el plugin de Android se usa ToObject o se accede al diccionario Data
                    // Si guardaste el campo como "nombre_usuario", lo obtenemos así:
                    var datos = snapshot.Data;
                    if (datos != null && datos.ContainsKey("nombre_usuario"))
                    {
                        nombre = datos["nombre_usuario"]?.ToString();
                    }
                }
#else
                // Uso de la librería de Google Cloud para Windows
                if (_firestoreDb != null)
                {
                    DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(user.Uid);
                    DocumentSnapshot snapshot = await docRef.GetSnapshotAsync();
                    if (snapshot.Exists)
                    {
                        nombre = snapshot.GetValue<string>("nombre_usuario");
                        text_welcome.Text = $"hola, \n{nombre}!";
                    }
                }
#endif

                if (!string.IsNullOrEmpty(nombre))
                {
                    text_welcome.Text = $"hola, \n{nombre}!";
                }
                else
                {
                    text_welcome.Text = "hola!";
                }
            }
        }
        catch (Exception ex)
        {
            text_welcome.Text = "hola!";
            System.Diagnostics.Debug.WriteLine($"Error cargando nombre: {ex.Message}");
        }
    }

    // --- Los demás métodos de navegación se mantienen igual ---

    private async void OnLogoutButtonClicked(object sender, EventArgs e)
    {
        bool answer = await DisplayAlert("Cerrar sesión", "¿Estás seguro de que quieres salir?", "Sí", "No");
        if (answer)
        {
            try
            {
                _authClient.SignOut();
                await Shell.Current.GoToAsync("//MainPage");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "No se pudo cerrar la sesión: " + ex.Message, "OK");
            }
        }
    }

    private async void OnNuevaEntradaClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("entry");
    }

    private async void OnAjustesClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("Ajustes");
    }

    private async void OnHistorialClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("Historial");
    }

    private async void OnEstadisticasClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("Estadisticas");
    }

    private async void OnCalendarioClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("Calendario");
    }

    private async void OnPerfilClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("Perfil");
    }

}