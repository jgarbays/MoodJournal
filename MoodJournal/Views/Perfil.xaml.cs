using Firebase.Auth;
using Google.Cloud.Firestore;
using System;
using Microsoft.Maui.Controls;
using Firebase.Storage;
#if ANDROID
using Plugin.CloudFirestore;
#endif

namespace MoodJournal.Views
{
    public partial class Perfil : ContentPage
    {
        // 1. Servicios inyectados (Igual que en Registro)
        private readonly FirebaseAuthClient _firebaseAuthClient;
        private readonly FirestoreDb _firestoreDb;

        public Perfil(FirebaseAuthClient authClient, FirestoreDb firestoreDb = null)
        {
            InitializeComponent();
            _firebaseAuthClient = authClient;
            _firestoreDb = firestoreDb;

            // Al cargar la página, recuperamos los datos
            CargarDatosUsuario();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            CargarDatosUsuario(); 
        }


        private async void CargarDatosUsuario()
        {
            try
            {

                // Obtenemos el usuario actual de Firebase Auth
                var user = _firebaseAuthClient.User;

                if (user != null)
                {
                    string userId = user.Uid;

#if ANDROID
                    // =======================
                    // ANDROID
                    // =======================

                    // Accedemos a Firestore usando el plugin nativo
                    var snapshot = await CrossCloudFirestore.Current
                                            .Instance
                                            .Collection("usuarios")   // Colección usuarios
                                            .Document(userId)         // Documento del usuario
                                            .GetAsync();              // Obtenemos el documento

                    // Verificamos que el documento existe
                    if (snapshot.Exists)
                    {
                        // Diccionario con los datos del usuario
                        var userData = snapshot.Data;

                        // Nombre del usuario
                        NombreLabel.Text = userData.ContainsKey("nombre_usuario")
                            ? userData["nombre_usuario"]?.ToString()
                            : "Usuario";

                        // Email (Firestore o Auth como respaldo)
                        EmailLabel.Text = userData.ContainsKey("email")
                            ? userData["email"]?.ToString()
                            : user.Info.Email;

                        // Teléfono
                        TelefonoLabel.Text = userData.ContainsKey("telefono")
                            ? userData["telefono"]?.ToString()
                            : "No definido";

                        // Fecha de nacimiento
                        FechaNacimientoLabel.Text = userData.ContainsKey("fecha_nacimiento")
                            ? userData["fecha_nacimiento"]?.ToString()
                            : "No definido";

                        // Foto de perfil (URL)
                        if (userData.ContainsKey("foto_url"))
                        {
                            ProfileImage.Source = userData["foto_url"]?.ToString();
                        }
                    }

#else
                // =======================
                // WINDOWS
                // =======================

                // Nos aseguramos de que Firestore esté disponible
                if (_firestoreDb != null)
                {
                    // Referencia al documento del usuario
                    DocumentReference docRef =
                        _firestoreDb.Collection("usuarios")
                                    .Document(userId);

                    // Obtenemos el documento desde Firestore
                    DocumentSnapshot snapshot = await docRef.GetSnapshotAsync();

                    // Verificamos que el documento existe
                    if (snapshot.Exists)
                    {
                        // Convertimos el documento a diccionario
                        Dictionary<string, object> userData =
                            snapshot.ToDictionary();

                        // Nombre del usuario
                        NombreLabel.Text = userData.ContainsKey("nombre_usuario")
                            ? userData["nombre_usuario"]?.ToString()
                            : "Usuario";

                        // Email
                        EmailLabel.Text = userData.ContainsKey("email")
                            ? userData["email"]?.ToString()
                            : user.Info.Email;

                        // Teléfono
                        TelefonoLabel.Text = userData.ContainsKey("telefono")
                            ? userData["telefono"]?.ToString()
                            : "No definido";

                        // Fecha de nacimiento
                        FechaNacimientoLabel.Text = userData.ContainsKey("fecha_nacimiento")
                            ? userData["fecha_nacimiento"]?.ToString()
                            : "No definido";

                        // Foto de perfil
                        if (userData.ContainsKey("foto_url"))
                        {
                            ProfileImage.Source =
                                userData["foto_url"]?.ToString();
                        }
                    }
                }
#endif
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "No se pudo cargar el perfil: " + ex.Message, "OK");
            }
        }

        // Método para el botón "atrás"
        private async void OnBackTapped(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync("//Home");
        }

        // Método para el botón "editar"
        private async void OnEditarClicked(object sender, EventArgs e)
        {
            // Creamos un diccionario con los datos actuales para pasarlos a la siguiente página
            var datosActuales = new Dictionary<string, string>
    {
        { "nombre", NombreLabel.Text },
        { "telefono", TelefonoLabel.Text },
        { "fecha", FechaNacimientoLabel.Text }
    };

            // Navegamos a la página de edición
            // Usamos Navigation.PushAsync para que pueda volver con el botón de atrás
            await Navigation.PushAsync(new EditarPerfil(datosActuales, _firestoreDb, _firebaseAuthClient));
        }
        // Método para cambiar la foto 
        private async void OnCambiarFotoClicked(object sender, EventArgs e)
        {
            try
            {
                // 1. Seleccionar la foto del móvil
                var photo = await MediaPicker.Default.PickPhotoAsync(); // Abre el picker nativo del dispositivo
                if (photo == null) return; // Si no se selecciona foto, se regresa

                // Mostrar un aviso de que se está subiendo
                await DisplayAlert("Subiendo", "Espera un momento mientras actualizamos tu foto...", "OK");

                // 2. Abrir el stream del archivo seleccionado
                using (var stream = await photo.OpenReadAsync())
                {
                    // 3. Configurar la subida a Firebase Storage indicando el bucket de Firebase de Moodjournal
                    var task = new FirebaseStorage("moodjournal-e3dff.firebasestorage.app")
                        .Child("fotos_perfil") // Dentro del bucket, va a donde están las fotos de perfil
                        .Child($"{_firebaseAuthClient.User.Uid}.jpg") // Busca específicamente el elemento asociado a este usuario
                        .PutAsync(stream); // Actualiza la foto con lo que llega a través del stream

                    // 4. Esperar a que termine y obtener la URL de descarga
                    string downloadUrl = await task;

                    // 5. Actualizar Firestore con la nueva URL
                    string uid = _firebaseAuthClient.User.Uid; // Obtiene el ID del usuario
#if ANDROID
                    // --- ANDROID (Plugin.CloudFirestore) ---
                    // Acceder a la instancia del plugin nativo
                    await CrossCloudFirestore.Current
                        .Instance
                        .Collection("usuarios")
                        .Document(uid)
                        //Recibe un diccionario de campos
                        .UpdateAsync(new Dictionary<string, object>
                        {
        { "foto_url", downloadUrl } //Actualiza solo el campo que contiene la url de la foto
                        });
#else
// --- WINDOWS (Google.Cloud.Firestore) ---
if (_firestoreDb != null)
{   //Creamos referencia al documento de usuario
    DocumentReference docRef =
        _firestoreDb.Collection("usuarios").Document(uid);
    //Actualizamos el campo de la url de la foto de este documento con la nueva url
    await docRef.UpdateAsync("foto_url", downloadUrl);
}
#endif
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "No se pudo subir la imagen: " + ex.Message, "OK");
            }
        }
    }
}