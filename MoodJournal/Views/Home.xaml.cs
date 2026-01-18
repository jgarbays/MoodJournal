using Firebase.Auth;
using MoodJournal.Views;
using MoodJournal.Services;
using MoodJournal.Models;

namespace MoodJournal.Views;

public partial class Home : ContentPage
{
    private readonly FirebaseAuthClient _authClient;
    private readonly IPersistenceStrategy _persistenceStrategy;

    public Home(FirebaseAuthClient authClient, IPersistenceStrategy persistenceStrategy)
    {
        InitializeComponent();
        _authClient = authClient;
        _persistenceStrategy = persistenceStrategy;   }

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
            string nombre = "";
            if (user != null)
            { string uid = user.Uid;

                UserProfile usuario = await _persistenceStrategy.GetDataFromUserAsync(uid);
             
   
               nombre = usuario?.nombre_usuario;
                    


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
        await Shell.Current.GoToAsync("///Perfil_tab");
    }

}