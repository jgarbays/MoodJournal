using Microsoft.Maui.Controls;
using MoodJournal.Views; // Asegúrate de que este sea el namespace correcto

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

            // 1. Registrar la ruta de la página Registro
            // Usamos nameof(Registro) para mayor seguridad.
            Routing.RegisterRoute(nameof(Registro), typeof(Registro));

            // 2. Opcional: Registrar la ruta de la página principal (si aún no lo está)
            // Routing.RegisterRoute(nameof(MainPage), typeof(MainPage));
        }
    }
}