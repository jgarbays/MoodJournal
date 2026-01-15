using System.Collections.ObjectModel;
using System.Globalization;
using Firebase.Auth;
using Google.Cloud.Firestore;
using Plugin.Maui.Calendar.Models;
#if ANDROID
using Plugin.CloudFirestore;
#endif

namespace MoodJournal.Views;

public partial class Calendario : ContentPage
{
    private readonly FirestoreDb _firestoreDb;
    private readonly FirebaseAuthClient _authClient;
    private List<JournalEntry> _todasEntradas = new();
    public EventCollection EntradasCalendario { get; set; } = new();

    public Calendario(FirebaseAuthClient authClient, FirestoreDb firestoreDb = null)
    {
        InitializeComponent();
        _authClient = authClient;
        _firestoreDb = firestoreDb;
       
        //La única manera de hacer funcionar 
        CalendarioControl.DayTappedCommand = new Command<DateTime>((fecha) =>
        {
            ActualizarDetalleEntrada(fecha);
        });
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await CargarDatosYCalendario();
    }

    private async Task CargarDatosYCalendario()
    {
        try
        {
            string uid = _authClient.User?.Uid;
            if (string.IsNullOrEmpty(uid)) return;

            Query query = _firestoreDb.Collection("usuarios").Document(uid)
                                      .Collection("entradas")
                                      .OrderByDescending("fecha");

            QuerySnapshot snapshot = await query.GetSnapshotAsync();

            _todasEntradas.Clear();
            var nuevasEntradas = new EventCollection();

#if ANDROID
            // --- LÓGICA ANDROID (Plugin.CloudFirestore) ---
            var querySnapshot = await CrossCloudFirestore.Current
                                        .Instance
                                        .Collection("usuarios")
                                        .Document(uid)
                                        .Collection("entradas")
                                        .OrderBy("fecha", descending: true)
                                        .GetAsync();

            foreach (var doc in querySnapshot.Documents)
            {
                var data = doc.Data;

                var entry = new JournalEntry
                {
                    Id = doc.Id,
                    Humor = data.ContainsKey("humor") ? data["humor"]?.ToString() : "indefinido",
                    Contenido = data.ContainsKey("contenido") ? data["contenido"]?.ToString() : "",
                    Fecha = data.ContainsKey("fecha")
                        ? Convert.ToDateTime(data["fecha"])
                        : DateTime.Now
                };

                _todasEntradas.Add(entry);

                if (!nuevasEntradas.ContainsKey(entry.Fecha.Date))
                {
                    nuevasEntradas.Add(entry.Fecha.Date, new List<JournalEntry> { entry });
                }
            }
#else
            // --- LÓGICA WINDOWS (Google.Cloud.Firestore) ---
            if (_firestoreDb != null)
            {
                Query busqueda = _firestoreDb.Collection("usuarios")
                                          .Document(uid)
                                          .Collection("entradas")
                                          .OrderByDescending("fecha");

                QuerySnapshot miSnapshot = await query.GetSnapshotAsync();
                foreach (DocumentSnapshot doc in snapshot.Documents)
                {
                    Dictionary<string, object> data = doc.ToDictionary();

                    var entry = new JournalEntry
                    {
                        Id = doc.Id,
                        Humor = data.ContainsKey("humor") ? data["humor"]?.ToString() : "indefinido",
                        Contenido = data.ContainsKey("contenido") ? data["contenido"]?.ToString() : "",
                        Fecha = data.ContainsKey("fecha")
                            ? ((Timestamp)data["fecha"]).ToDateTime()
                            : DateTime.Now
                    };

                    _todasEntradas.Add(entry);

                    if (!nuevasEntradas.ContainsKey(entry.Fecha.Date))
                    {
                        nuevasEntradas.Add(entry.Fecha.Date, new List<JournalEntry> { entry });
                    }
                }
            }
#endif

            EntradasCalendario = nuevasEntradas;

            // Forzamos al control a reconocer las entradas
            CalendarioControl.Events = EntradasCalendario;

            // Mostrar hoy por defecto al cargar
            ActualizarDetalleEntrada(DateTime.Today);
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", "No se pudo cargar: " + ex.Message, "OK");
        }
    }

    private void ActualizarDetalleEntrada(DateTime fechaSeleccionada)
    {
        // Buscamos la entrada que coincida con la fecha tocada
        var entrada = _todasEntradas.FirstOrDefault(x => x.Fecha.Date == fechaSeleccionada.Date);

        if (entrada != null)
        {
            LabelEmoji.Text = ObtenerEmojiSegunHumor(entrada.Humor);
            LabelHumor.Text = entrada.Humor;
            LabelContenido.Text = entrada.Contenido;
            StackDetalle.IsVisible = true;
        }
        else
        {
            // Si no hay entrada, ocultamos el panel
            StackDetalle.IsVisible = false;
        }
    }

    private string ObtenerEmojiSegunHumor(string humor)
    {
        if (string.IsNullOrEmpty(humor)) return "📝"; // Default si no hay nada

        return humor.ToLower().Trim() switch
        {
            "feliz"  => "😄",
            "triste"  => "☹️",
            "enfadado" => "😡",
            "nervioso" => "😟",
            "contento" => "🙂",
            "meh" => "😐",
            _ => "📝" // Emoji por defecto
        };
    }

    private async void OnBackTapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("//Home");
    }
}