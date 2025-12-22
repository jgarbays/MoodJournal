using Firebase.Auth;
using Google.Cloud.Firestore;
using MoodJournal.Views;

namespace MoodJournal.Views;

public partial class Home : ContentPage
{
    private readonly FirebaseAuthClient _authClient;
    private readonly FirestoreDb _firestoreDb;

    public Home(FirebaseAuthClient authClient, FirestoreDb firestoreDb)
    {
        InitializeComponent();
        _authClient = authClient;
        _firestoreDb = firestoreDb;
    }

    // OnAppearing se ejecuta cada vez que la pantalla se vuelve visible
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
                // Buscamos en la colección "usuarios" el documento que tiene el ID del usuario actual
                DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(user.Uid);
                DocumentSnapshot snapshot = await docRef.GetSnapshotAsync();

                if (snapshot.Exists)
                {
                    // Obtenemos el campo "nombre_usuario" que guardamos en el Registro
                    string nombre = snapshot.GetValue<string>("nombre_usuario");
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
            // Si algo falla, ponemos un saludo genérico para que la app no se cierre
            text_welcome.Text = "hola!";
            System.Diagnostics.Debug.WriteLine($"Error cargando nombre: {ex.Message}");
        }
    }

    private async void OnLogoutButtonClicked(object sender, EventArgs e)
    {
        bool answer = await DisplayAlert("Cerrar sesión", "¿Estás seguro de que quieres salir?", "Sí", "No");

        if (answer)
        {
            try
            {
                _authClient.SignOut();
                // Usamos // para resetear la navegación y volver al Login
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
        // IMPORTANTE: Usamos Shell para que MAUI se encargue de la Inyección de Dependencias
        await Shell.Current.GoToAsync("entry");
    }

    private async void OnAjustesClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("Ajustes");
    }
}