namespace MoodJournal.Views;

public partial class Home : ContentPage
{
	public Home()
	{
		InitializeComponent();
	}


    //navegación temporal para simular un cierre de sesión
    private async void OnLogoutButtonClicked(object sender, EventArgs e)
    {

        await Navigation.PushAsync(new MainPage());
    }


    //navegación a la página de nueva entrada

    private async void OnNuevaEntradaClicked(object sender, EventArgs e)
    {

        await Navigation.PushAsync(new entry());
    }

    private async void OnAjustesClicked(object sender, EventArgs e)
    {

        await Navigation.PushAsync(new Ajustes());
    }
}