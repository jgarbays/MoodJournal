using Firebase.Auth;
using Google.Cloud.Firestore;
using System;
using Microsoft.Maui.Controls;
using Firebase.Storage; 

namespace MoodJournal.Views
{
    public partial class Perfil : ContentPage
    {
        // 1. Servicios inyectados (Igual que en Registro)
        private readonly FirebaseAuthClient _firebaseAuthClient;
        private readonly FirestoreDb _firestoreDb;

        public Perfil(FirebaseAuthClient authClient, FirestoreDb firestoreDb)
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
            CargarDatosUsuario(); // Se ejecutará cada vez que la página sea visible
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

                    // 2. Leer datos desde la colección "usuarios" en Firestore
                    DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(userId);
                    DocumentSnapshot snapshot = await docRef.GetSnapshotAsync();

                    if (snapshot.Exists)
                    {
                        // Convertimos el documento a un diccionario
                        Dictionary<string, object> userData = snapshot.ToDictionary();

                        // 3. Actualizar la interfaz con los datos de Firestore
                        // Usamos los mismos nombres de campo que definiste en el Registro
                        NombreLabel.Text = userData.ContainsKey("nombre_usuario")
                            ? userData["nombre_usuario"].ToString()
                            : "Usuario";

                        EmailLabel.Text = userData.ContainsKey("email")
                            ? userData["email"].ToString()
                            : user.Info.Email;

                        // Datos adicionales que podrías haber guardado o que el usuario editará
                        TelefonoLabel.Text = userData.ContainsKey("telefono")
                            ? userData["telefono"].ToString()
                            : "No definido";

                        FechaNacimientoLabel.Text = userData.ContainsKey("fecha_nacimiento")
                            ? userData["fecha_nacimiento"].ToString()
                            : "No definido";

                        // Si guardas la URL de la foto en Firestore
                        if (userData.ContainsKey("foto_url"))
                        {
                            ProfileImage.Source = userData["foto_url"].ToString();
                        }
                    }
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
        // Método para cambiar la foto (Lápiz)
        private async void OnCambiarFotoClicked(object sender, EventArgs e)
        {
            try
            {
                // 1. Seleccionar la foto del móvil
                var photo = await MediaPicker.Default.PickPhotoAsync();
                if (photo == null) return;

                // Mostrar un aviso de que se está subiendo
                await DisplayAlert("Subiendo", "Espera un momento mientras actualizamos tu foto...", "OK");

                // 2. Abrir el stream del archivo seleccionado
                using (var stream = await photo.OpenReadAsync())
                {
                    // 3. Configurar la subida a Firebase Storage
                    // Reemplaza "tu-proyecto.appspot.com" con tu bucket real de Firebase
                    var task = new FirebaseStorage("moodjournal-e3dff.firebasestorage.app")
                        .Child("fotos_perfil")
                        .Child($"{_firebaseAuthClient.User.Uid}.jpg")
                        .PutAsync(stream);

                    // 4. Esperar a que termine y obtener la URL de descarga
                    string downloadUrl = await task;

                    // 5. Actualizar Firestore con la nueva URL
                    string uid = _firebaseAuthClient.User.Uid;
                    DocumentReference docRef = _firestoreDb.Collection("usuarios").Document(uid);

                    await docRef.UpdateAsync("foto_url", downloadUrl);

                    // 6. Actualizar la imagen en la pantalla
                    ProfileImage.Source = ImageSource.FromUri(new Uri(downloadUrl));

                    await DisplayAlert("Éxito", "Foto de perfil actualizada", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "No se pudo subir la imagen: " + ex.Message, "OK");
            }
        }
    }
}