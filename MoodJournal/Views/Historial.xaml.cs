using Google.Cloud.Firestore;
using Firebase.Auth;
using System.Collections.ObjectModel;
using MoodJournal.Models;
using MoodJournal.Services;


#if ANDROID
using Plugin.CloudFirestore;
#endif

namespace MoodJournal.Views;

public partial class Historial : ContentPage
{
    private ObservableCollection<JournalEntry> Entradas { get; set; } = [];
    private List<JournalEntry> _todasLasEntradas = [];
    private readonly FirebaseAuthClient _authClient;
    private readonly IPersistenceStrategy _persistenceStrategy;

    public Historial(IPersistenceStrategy persistenceStrategy, FirebaseAuthClient authClient)
    {
        InitializeComponent();
        this._authClient = authClient;
        this._persistenceStrategy = persistenceStrategy;
        CollectionHistorial.ItemsSource = Entradas;

        CargarHistorial();
    }

    private async void CargarHistorial()
    {
        try
        {

            string uid = _authClient.User.Uid;
            _todasLasEntradas.Clear();
            Entradas.Clear();

            _todasLasEntradas = await _persistenceStrategy.GetJournalEntriesAsync(uid);

            CargarMesesEnPicker();
            ActualizarListaVisual(_todasLasEntradas);
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", "No se pudo cargar el historial: " + ex.Message, "OK");
        }
    }

    private void CargarMesesEnPicker()
    {
        var mesesUnicos = _todasLasEntradas
            .Select(x => x.MesAnio)
            .Distinct()
            .ToList();

        PickerFiltroMes.Items.Clear();
        PickerFiltroMes.Items.Add("Todos los meses");

        foreach (var mes in mesesUnicos)
        {
            PickerFiltroMes.Items.Add(mes);
        }
    }

    private void OnFiltroChanged(object sender, EventArgs e)
    {
        var humorSeleccionado = PickerFiltroHumor.SelectedItem?.ToString();
        var mesSeleccionado = PickerFiltroMes.SelectedItem?.ToString();

        IEnumerable<JournalEntry> resultado = _todasLasEntradas;

        // Filtro de Humor con protección contra nulos
        if (!string.IsNullOrEmpty(humorSeleccionado) && humorSeleccionado != "Todos")
        {
            resultado = resultado.Where(x =>
                x.Humor != null &&
                x.Humor.Equals(humorSeleccionado, StringComparison.OrdinalIgnoreCase));
        }

        // Filtro de Mes
        if (!string.IsNullOrEmpty(mesSeleccionado) && mesSeleccionado != "Todos los meses")
        {
            resultado = resultado.Where(x => x.MesAnio == mesSeleccionado);
        }

        ActualizarListaVisual(resultado);
    }

    private void ActualizarListaVisual(IEnumerable<JournalEntry> listaFiltrada)
    {
        Entradas.Clear();
        foreach (var item in listaFiltrada)
        {
            Entradas.Add(item);
        }
    }

    private async void OnEntrySelected(object sender, SelectionChangedEventArgs e)
    {
        // 1. Obtener el objeto seleccionado
        var entradaSeleccionada = e.CurrentSelection.FirstOrDefault() as JournalEntry;

        if (entradaSeleccionada != null)
        {
            // 2. Navegar a la página de detalle pasando la entrada
            await Navigation.PushAsync(new DetalleEntrada(entradaSeleccionada));

            // 3. Deseleccionar el ítem para que no se quede marcado en gris
            ((CollectionView)sender).SelectedItem = null;
        }
    }

    private async void OnBackTapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("//Home");

    }
}