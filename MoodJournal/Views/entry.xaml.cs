namespace MoodJournal.Views;

public partial class entry : ContentPage
{
	public entry()
	{
		InitializeComponent();
	}

	private async void OnBackTapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("//Home");
    }
}