using Firebase.Auth;
using Google.Cloud.Firestore;

namespace MoodJournal.Views;

public partial class EditarPerfil : ContentPage
{
    private readonly FirestoreDb _firestoreDb;
    private readonly FirebaseAuthClient _authClient;

    public EditarPerfil(Dictionary<string, string> datos, FirestoreDb db, FirebaseAuthClient auth)
    {
        InitializeComponent();
        _firestoreDb = db;
        _authClient = auth;

        // Rellenamos los campos con los datos que ya tenemos
        EntryNombre.Text = datos["nombre"];
        EntryTelefono.Text = datos["telefono"];
        // PickerFecha.Date = ... (puedes convertir el string a DateTime)
    }

    private async void OnGuardarClicked(object sender, EventArgs e)
    {
        try
        {
            string uid = _authClient.User.Uid;
            DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(uid);

            // Actualizamos solo los campos que cambiaron en Firestore
            Dictionary<string, object> actualizaciones = new Dictionary<string, object>
            {
                { "nombre_usuario", EntryNombre.Text },
                { "telefono", EntryTelefono.Text },
                { "fecha_nacimiento", PickerFecha.Date.ToString("dd - MM - yyyy") }
            };

            await docRef.UpdateAsync(actualizaciones);

            await DisplayAlert("Éxito", "Perfil actualizado correctamente", "OK");

            // Volvemos a la página anterior
            await Navigation.PopAsync();
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", "No se pudo guardar: " + ex.Message, "OK");
        }
    }
}