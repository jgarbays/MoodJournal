using MoodJournal.Views;

namespace MoodJournal
{
    public partial class App : Application
    {
        public App(MainPage loginPage)
        {
            InitializeComponent();

            

            // O si usas Shell (recomendado):
            // MainPage = new AppShell(); 
        }

        protected override Window CreateWindow(IActivationState? activationState)
        {
            return new Window(new AppShell());

        }
    }
}