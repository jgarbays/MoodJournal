using Microsoft.Maui.Controls;
using MoodJournal.Views; 
namespace MoodJournal
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            // ==========================================================
            // AÑADIR: REGISTRO DE RUTAS
            // ==========================================================

          
            Routing.RegisterRoute(nameof(Registro), typeof(Registro));
            Routing.RegisterRoute("Home", typeof(Home));
            Routing.RegisterRoute("Ajustes", typeof(Ajustes));
            Routing.RegisterRoute("entry", typeof(entry));
            Routing.RegisterRoute("Perfil", typeof(Perfil));

           
        }
    }
}