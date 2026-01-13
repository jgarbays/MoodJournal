namespace MoodJournal.Views;

public partial class DetalleEntrada : ContentPage
{
    public DetalleEntrada(JournalEntry entrada)
    {
        InitializeComponent();
        BindingContext = entrada; // Esto "conecta" los datos al XAML automáticamente
    }

    private async void OnBackTapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("Historial");
    }
}