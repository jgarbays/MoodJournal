using System.Collections.ObjectModel;
using System.Globalization;
using Firebase.Auth;
using Google.Cloud.Firestore;
using MoodJournal.Models;
using Plugin.Maui.Calendar.Models;
using MoodJournal.Services;


#if ANDROID
using Plugin.CloudFirestore;
#endif

namespace MoodJournal.Views;

public partial class Calendario : ContentPage
{
   
    private readonly FirebaseAuthClient _authClient;
    private List<JournalEntry> _todasEntradas = new();
    public EventCollection EntradasCalendario { get; set; } = new();
    private readonly IPersistenceStrategy _persistenceStrategy;

    public Calendario(FirebaseAuthClient authClient, IPersistenceStrategy persistenceStrategy)
    {
        InitializeComponent();
        _authClient = authClient;
        _persistenceStrategy = persistenceStrategy;
       
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

          
            var nuevasEntradas = new EventCollection();
            _todasEntradas = await _persistenceStrategy.GetJournalEntriesAsync(uid);


            EntradasCalendario = nuevasEntradas;

            
            foreach (var entrada in _todasEntradas)
            {
                // Usamos .Date para comparar solo el día, sin importar la hora exacta
                DateTime fechaDia = entrada.Fecha.Date;

                // Solo añadimos si esa fecha NO existe ya en la colección
                if (!nuevasEntradas.ContainsKey(fechaDia))
                {
                    nuevasEntradas.Add(fechaDia, new List<string> { "Puntito" });
                }
                else
                {
                    // Si ya existe y quieres añadir más información al mismo día:
                    var listaExistente = (List<string>)nuevasEntradas[fechaDia];
                    listaExistente.Add("Otro puntito");
                }
            }
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