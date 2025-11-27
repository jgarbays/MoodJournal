namespace MoodJournal.Views
{
    public partial class MainPage : ContentPage
    {
      

        public MainPage()
        {
            InitializeComponent();
        }

        // Método llamado cuando el usuario toca "registrarse"
        private async void OnRegisterTapped(object sender, TappedEventArgs e)
        {
            // 1. Obtén el proveedor de servicios (IServiceProvider)
            // El servicio está disponible a través del Handler del Shell.
            var serviceProvider = Shell.Current.Handler.MauiContext.Services;

            // 2. Pídele al proveedor de servicios que cree la instancia de Registro.
            // MAUI automáticamente le pasará el FirebaseAuthClient y FirestoreDb.
            var registroPage = serviceProvider.GetService<Registro>();

            // 3. Navega a la página obtenida.
            if (registroPage != null)
            {
                await Navigation.PushAsync(registroPage);
            }
        }

        // Este es el método de navegación temporal
        private async void OnLoginButtonClicked(object sender, EventArgs e)
        {

            await Navigation.PushAsync(new Home());
        }



    }
}
