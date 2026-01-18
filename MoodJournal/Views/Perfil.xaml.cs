using Firebase.Auth;
using Google.Cloud.Firestore;
using System;
using Microsoft.Maui.Controls;
using MoodJournal.Models;
using MoodJournal.Services;
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
        private readonly IPersistenceStrategy _persistenceStrategy;
        public Perfil(FirebaseAuthClient authClient, IPersistenceStrategy persistenceStrategy)
        {
            InitializeComponent();
            _firebaseAuthClient = authClient;
           _persistenceStrategy = persistenceStrategy;

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
                string uid = _firebaseAuthClient.User.Uid;
                UserProfile profile = await _persistenceStrategy.GetDataFromUserAsync(uid);


                if (profile != null)
                {
                    NombreLabel.Text = profile.nombre_usuario ?? "Usuario";
                    EmailLabel.Text = profile.email ?? "No definido";
                    TelefonoLabel.Text = profile.telefono ?? "No definido";
                    FechaNacimientoLabel.Text = profile.fecha_nacimiento ?? "No definido";

                    if (!string.IsNullOrEmpty(profile.foto_url))
                        ProfileImage.Source = profile.foto_url;
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
            await Navigation.PushAsync(new EditarPerfil(datosActuales, _persistenceStrategy, _firebaseAuthClient));
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
                    await _persistenceStrategy.UpdateProfilePhotoAsync(uid, downloadUrl);

                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "No se pudo subir la imagen: " + ex.Message, "OK");
            }
        }
    }
}