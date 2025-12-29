using Firebase.Auth;
using Google.Cloud.Firestore;
using Microsoft.Maui.Controls.Shapes;

namespace MoodJournal.Views;

public partial class entry : ContentPage
{
    private readonly FirebaseAuthClient _authClient;
    private readonly FirestoreDb _firestoreDb;
    private string _selectedMood = ""; // Para guardar el humor elegido

    public entry(FirebaseAuthClient authClient, FirestoreDb firestoreDb)
    {
        InitializeComponent();
        _authClient = authClient;
        _firestoreDb = firestoreDb;
    }

    // Método para seleccionar el humor
    private void OnMoodSelected(object sender, TappedEventArgs e)
    {
        // 1. guardar el humor seleccionado
        _selectedMood = e.Parameter.ToString();

        // 2. Resetear fondos y clips de todos los StackLayouts
        var stacks = new[] { StackContento, StackFeliz, StackMeh, StackNervioso, StackEnfadado, StackTriste };

        foreach (var s in stacks)
        {
            s.BackgroundColor = Colors.Transparent;
            s.Clip = null; // Quitamos el recorte para que no afecte al estado transparente
        }

        // 3. Pintar el seleccionado
        if (sender is StackLayout layoutSeleccionado)
        {
            // Intentamos obtener el color de los recursos globales de la App si no están en la página
            Color colorRosa;
            if (Application.Current.Resources.TryGetValue("ColorPrincipalRosa", out var resColor))
                colorRosa = (Color)resColor;
            else
                colorRosa = Color.FromArgb("#E57373"); // Color de respaldo por si falla el recurso

            layoutSeleccionado.BackgroundColor = colorRosa;

            // Aplicamos el redondeo de esquinas
            layoutSeleccionado.Clip = new RoundRectangleGeometry(new CornerRadius(10), new Rect(0, 0, 55, 70));
        }
    }

    private async void OnGuardarEntradaClicked(object sender, EventArgs e)
    {
        string textoEntrada = edit_text_journal_entry.Text?.Trim();

        if (string.IsNullOrEmpty(_selectedMood))
        {
            await DisplayAlert("Atención", "Por favor, selecciona cómo te sientes.", "OK");
            return;
        }

        if (string.IsNullOrEmpty(textoEntrada))
        {
            await DisplayAlert("Atención", "Escribe algo sobre tu día antes de guardar.", "OK");
            return;
        }

        try
        {
            string uid = _authClient.User.Uid;

            // 1. Definir los datos de la entrada
            var nuevaEntrada = new Dictionary<string, object>
            {
                { "humor", _selectedMood },
                { "contenido", textoEntrada },
                { "fecha", DateTime.UtcNow },
                { "timestamp", FieldValue.ServerTimestamp } // Útil para ordenar por fecha real
            };

            // 2. Guardar en Firestore: usuarios/{uid}/entradas/{id_automatico}
            CollectionReference entradasRef = _firestoreDb
                .Collection("usuarios")
                .Document(uid)
                .Collection("entradas");

            await entradasRef.AddAsync(nuevaEntrada);

            await DisplayAlert("¡Guardado!", "Tu entrada de hoy se ha guardado correctamente.", "OK");

            // 3. Volver a la Home
            await Shell.Current.GoToAsync("//Home");
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", "No se pudo guardar la entrada: " + ex.Message, "OK");
        }
    }

    private async void OnBackTapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("//Home");
    }
}