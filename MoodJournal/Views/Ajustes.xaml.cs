using Firebase.Auth;
using Google.Cloud.Firestore;
using System.ComponentModel;
using Plugin.LocalNotification;

namespace MoodJournal.Views;

public partial class Ajustes : ContentPage
{
    private readonly FirebaseAuthClient _authClient;
    private readonly FirestoreDb _firestoreDb;

    public Ajustes(FirebaseAuthClient authClient, FirestoreDb firestoreDb)
    {
        InitializeComponent();
        _authClient = authClient;
        _firestoreDb = firestoreDb;

        // Crea un temporizador que se ejecuta cada 1 minuto (60 segundos)
        IDispatcherTimer timer = Dispatcher.CreateTimer();
        timer.Interval = TimeSpan.FromSeconds(60);
        timer.Tick += (s, e) => ActualizarFechaSistema();
        timer.Start();
        // Inicializamos el texto del botón con la hora actual o una guardada
        CargarPreferenciasRecordatorio();
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        ActualizarFechaSistema();
    }

    // 1. VOLVER ATRÁS
    private async void OnBackTapped(object sender, TappedEventArgs e)
    {
        // ".." le dice a Shell que vuelva a la pantalla anterior
        await Shell.Current.GoToAsync("..");
    }

    private void ActualizarFechaSistema()
    {
        // Obtenemos la fecha y hora actual del sistema
        DateTime ahora = DateTime.Now;

        // La formateamos para que coincida con tu diseño: "12 feb | 19:15"
        // "dd MMM" -> día y mes abreviado
        // "HH:mm" -> hora y minutos
        string fechaFormateada = ahora.ToString("dd MMM | HH:mm").ToLower();

        // Lo asignamos a la etiqueta
        CurrentTimeLabel.Text = fechaFormateada;
    }

    private void CargarPreferenciasRecordatorio()
    {
        // Recuperamos la hora guardada o ponemos 20:00 por defecto
        string horaGuardada = Preferences.Default.Get("reminder_time", "20:00");
        ReminderTimeLabel.Text = horaGuardada;
        HiddenTimePicker.Time = TimeSpan.TryParse(Preferences.Default.Get("reminder_time", "20:00"), out var ts) ? ts : new TimeSpan(20, 0, 0);

        // También cargamos el estado del Switch
        ReminderSwitch.IsToggled = Preferences.Default.Get("reminder_enabled", true);
    }

   

    // 2. ABRIR EL SELECTOR DE HORA
    private void OnReminderTimeTapped(object sender, EventArgs e)
    {
        HiddenTimePicker.IsVisible = true;
        // Al hacer Focus, se abre el selector nativo del móvil
        HiddenTimePicker.Focus();
    }

    // 3. ACTUALIZAR TEXTO CUANDO CAMBIA LA HORA
    private async void OnTimePickerPropertyChanged(object sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName == TimePicker.TimeProperty.PropertyName)
        {
            var timePicker = sender as TimePicker;
            if (timePicker == null) return; // seguridad

            var time = timePicker.Time;
            ReminderTimeLabel.Text = time.ToString(@"hh\:mm");
            Preferences.Default.Set("reminder_time", ReminderTimeLabel.Text);

            if (ReminderSwitch.IsToggled)
                await ProgramarRecordatorio(time);

            timePicker.IsVisible = false;
        }
    }



    // 4. ACTIVAR/DESACTIVAR RECORDATORIO
    private async void OnReminderToggled(object sender, ToggledEventArgs e)
    {
        Preferences.Default.Set("reminder_enabled", e.Value);

        if (e.Value)
        {
            // Si el TimePicker no ha sido usado, usamos la hora guardada
            string horaGuardada = Preferences.Default.Get("reminder_time", "20:00");
            if (TimeSpan.TryParse(horaGuardada, out var time))
            {
                await ProgramarRecordatorio(time);
            }
        }
        else
        {
            LocalNotificationCenter.Current.Cancel(100);
        }
    }

    private async Task ProgramarRecordatorio(TimeSpan hora)
    {
        var center = LocalNotificationCenter.Current;
        if (center == null)
        {
            await DisplayAlert("Error", "Notificaciones locales no disponibles.", "OK");
            return;
        }

        var notification = new NotificationRequest
        {
            NotificationId = 100, // ID fijo para poder reemplazarla
            Title = "MoodJournal 💖",
            Description = "Es hora de registrar cómo te sientes hoy",
            Schedule = new NotificationRequestSchedule
            {
                NotifyTime = DateTime.Today.Add(hora) < DateTime.Now
                    ? DateTime.Today.AddDays(1).Add(hora)
                    : DateTime.Today.Add(hora),
                RepeatType = NotificationRepeat.Daily
            }
        };

        await LocalNotificationCenter.Current.Show(notification);
    }


    // 5. BORRAR CUENTA (Acción crítica)
    private async void OnBorrarCuentaClicked(object sender, EventArgs e)
    {
        // 1. PRIMERA CONFIRMACIÓN
        bool confirm = await DisplayAlert("⚠️ Acción Crítica",
            "¿Estás seguro de que quieres borrar tu cuenta? Todos tus datos se perderán para siempre.",
            "Sí, continuar", "Cancelar");

        if (!confirm) return;

        // 2. PEDIR CONTRASEÑA PARA CONFIRMAR
        // Usamos DisplayPromptAsync para mostrar un cuadro de texto
        string passwordConfirm = await DisplayPromptAsync("Confirmar Identidad",
            "Por favor, introduce tu contraseña para confirmar el borrado:",
            accept: "BORRAR DEFINITIVAMENTE",
            cancel: "Cancelar",
            placeholder: "Tu contraseña",
            keyboard: Keyboard.Text);

        if (string.IsNullOrWhiteSpace(passwordConfirm)) return;

        try
        {
            var user = _authClient.User;
            if (user != null)
            {
                // 3. RE-AUTENTICACIÓN (Paso de seguridad de Firebase)
                // Intentamos hacer un "mini-login" interno para validar la contraseña
                await _authClient.SignInWithEmailAndPasswordAsync(user.Info.Email, passwordConfirm);

                // 4. BORRAR DATOS DE FIRESTORE
                await _firestoreDb.Collection("usuarios").Document(user.Uid).DeleteAsync();

                // 5. BORRAR EL USUARIO DE AUTH
                await user.DeleteAsync();

                await DisplayAlert("Cuenta eliminada", "Tu cuenta y tus datos han sido eliminados.", "OK");

                // 6. LIMPIAR PREFERENCIAS Y VOLVER AL INICIO
                Preferences.Default.Clear();
                SecureStorage.Default.RemoveAll();
                await Shell.Current.GoToAsync("//MainPage");
            }
        }
        catch (FirebaseAuthException authEx)
        {
            // Si la contraseña introducida en el prompt es incorrecta
            if (authEx.Reason == AuthErrorReason.WrongPassword)
            {
                await DisplayAlert("Error", "La contraseña no es correcta. No se pudo borrar la cuenta.", "Aceptar");
            }
            else
            {
                await DisplayAlert("Error", "Error de autenticación: " + authEx.Message, "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", "No se pudo completar la acción: " + ex.Message, "OK");
        }
    }
}