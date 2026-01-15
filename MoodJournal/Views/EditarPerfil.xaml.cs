using Firebase.Auth;
using Google.Cloud.Firestore;
#if ANDROID
using Plugin.CloudFirestore;
#endif

namespace MoodJournal.Views;

public partial class EditarPerfil : ContentPage
{
    private readonly FirestoreDb _firestoreDb;
    private readonly FirebaseAuthClient _authClient;

    public EditarPerfil(Dictionary<string, string> datos, FirestoreDb db, FirebaseAuthClient auth=null)
    {
        InitializeComponent();
        _firestoreDb = db;
        _authClient = auth;

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
            DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(uid);

            // Actualizamos solo los campos que cambiaron en Firestore
            Dictionary<string, object> actualizaciones = new Dictionary<string, object>
            {
                { "nombre_usuario", EntryNombre.Text },
                { "telefono", EntryTelefono.Text },
                { "fecha_nacimiento", PickerFecha.Date.ToString("dd - MM - yyyy") }
            };

#if ANDROID
            // =======================
            // ANDROID (Plugin.CloudFirestore)
            // =======================

            // Accedemos a Firestore mediante el plugin nativo
            await CrossCloudFirestore.Current
                .Instance
                .Collection("usuarios")
                .Document(uid)
                .UpdateAsync(actualizaciones);

#else
        // =======================
        // WINDOWS (Google.Cloud.Firestore)
        // =======================

        if (_firestoreDb != null)
        {
            // Referencia al documento del usuario
            DocumentReference docRefer =
                _firestoreDb
                    .Collection("usuarios")
                    .Document(uid);

            // Actualizamos los campos indicados en el diccionario
            await docRef.UpdateAsync(actualizaciones);
        }
#endif
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