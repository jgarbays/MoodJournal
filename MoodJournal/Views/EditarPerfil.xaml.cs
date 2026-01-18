using Firebase.Auth;
using MoodJournal.Services;

namespace MoodJournal.Views;

public partial class EditarPerfil : ContentPage
{
    private readonly IPersistenceStrategy _persistenceStrategy;
    private readonly FirebaseAuthClient _authClient;


    public EditarPerfil(Dictionary<string, string> datos, IPersistenceStrategy persistenceStrategy,  FirebaseAuthClient authClient
)
    {
        InitializeComponent();
_persistenceStrategy = persistenceStrategy;
            _authClient = authClient;

        // Rellenamos los campos con los datos que ya tenemos
        EntryNombre.Text = datos["nombre"];
        EntryTelefono.Text = datos["telefono"];
        if (datos.ContainsKey("fecha") && !string.IsNullOrEmpty(datos["fecha"]))
        {
            if (DateTime.TryParse(datos["fecha"], out DateTime fechaParseada))
            {
                PickerFecha.Date = fechaParseada;
            }
        }
    }

    private async void OnGuardarClicked(object sender, EventArgs e)
    {
        try
        {
            string uid = _authClient.User.Uid;
            // Actualizamos solo los campos que cambiaron en Firestore
            Dictionary<string, object> actualizaciones = new Dictionary<string, object>
            {
                { "nombre_usuario", EntryNombre.Text },
                { "telefono", EntryTelefono.Text },
                { "fecha_nacimiento", PickerFecha.Date.ToString("dd - MM - yyyy") }
            };


            await _persistenceStrategy.UpdateProfileAsync(uid, actualizaciones);
            await DisplayAlert("Éxito", "Perfil actualizado correctamente", "OK");

            // Volvemos a la página anterior
            await Shell.Current.GoToAsync("///Perfil_tab");
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", "No se pudo guardar: " + ex.Message, "OK");
        }
    }
}