using Firebase.Auth;
using System.ComponentModel;
using Plugin.LocalNotification;
using MoodJournal.Services;




namespace MoodJournal.Views;

public partial class Ajustes : ContentPage
{
    private readonly FirebaseAuthClient _authClient;
    private readonly IPersistenceStrategy _persistenceStrategy; 
    private bool _isInitializing = true; // <--- VITAL: Bloquea eventos al arrancar

    public Ajustes(FirebaseAuthClient authClient, IPersistenceStrategy persistenceStrategy)
    {
        InitializeComponent();
        _authClient = authClient;
_persistenceStrategy = persistenceStrategy;

        _isInitializing = true;

        // 1. Iniciar reloj del sistema
        ConfigurarReloj();

        // 2. Cargar preferencias sin disparar errores
        CargarPreferenciasRecordatorio();

        _isInitializing = false;
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        ActualizarFechaSistema();
    }

    private void ConfigurarReloj()
    {
        IDispatcherTimer timer = Dispatcher.CreateTimer();
        timer.Interval = TimeSpan.FromSeconds(60);
        timer.Tick += (s, e) => ActualizarFechaSistema();
        timer.Start();
    }

    private void ActualizarFechaSistema()
    {
        DateTime ahora = DateTime.Now;
        CurrentTimeLabel.Text = ahora.ToString("dd MMM | HH:mm").ToLower();
    }

    private void CargarPreferenciasRecordatorio()
    {
        // Recuperar hora guardada
        string horaGuardada = Preferences.Default.Get("reminder_time", "20:00");
        ReminderTimeLabel.Text = horaGuardada;

        if (TimeSpan.TryParse(horaGuardada, out var ts))
        {
            HiddenTimePicker.Time = ts;
        }

        // Cargar estado del Switch (esto disparará OnReminderToggled, 
        // pero la bandera _isInitializing evitará el crash)
        ReminderSwitch.IsToggled = Preferences.Default.Get("reminder_enabled", true);
    }

    // 1. VOLVER ATRÁS
    private async void OnBackTapped(object sender, TappedEventArgs e)
    {
        await Shell.Current.GoToAsync("..");
    }

    // 2. ABRIR EL SELECTOR (Al clicar el botón verde)
    private void OnReminderTimeTapped(object sender, EventArgs e)
    {
        HiddenTimePicker.IsVisible = true;
        HiddenTimePicker.Focus();
    }

    // 3. ACTUALIZAR HORA CUANDO SE ELIGE EN EL PICKER
    private async void OnTimePickerPropertyChanged(object sender, PropertyChangedEventArgs e)
    {
        // Solo actuar si cambió la hora y no estamos inicializando
        if (e.PropertyName == TimePicker.TimeProperty.PropertyName && !_isInitializing)
        {
            var time = HiddenTimePicker.Time;
            string horaFormateada = time.ToString(@"hh\:mm");

            ReminderTimeLabel.Text = horaFormateada;
            Preferences.Default.Set("reminder_time", horaFormateada);

            if (ReminderSwitch.IsToggled)
            {
                await ProgramarRecordatorio(time);
            }

            HiddenTimePicker.IsVisible = false;
        }
    }

    // 4. ACTIVAR/DESACTIVAR (El Switch)
    private async void OnReminderToggled(object sender, ToggledEventArgs e)
    {
        if (_isInitializing) return; // Si la app está arrancando, no tocar notificaciones

        Preferences.Default.Set("reminder_enabled", e.Value);

        try
        {
            if (e.Value)
            {
                await ProgramarRecordatorio(HiddenTimePicker.Time);
            }
            else
            {
                // El operador ?. evita el NullReferenceException si el plugin falla
                LocalNotificationCenter.Current?.Cancel(100);
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Error de notificación: {ex.Message}");
        }
    }

    private async Task ProgramarRecordatorio(TimeSpan hora)
    {
        // Verificación de seguridad extra
        if (LocalNotificationCenter.Current == null) return;

        var notification = new NotificationRequest
        {
            NotificationId = 100,
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



                // 2. Borrado de datos en Firestore (Lógica Híbrida)
                
                await _persistenceStrategy.DeleteAccountAsync(user.Uid);    

                // 3. Borrar el usuario de Firebase Auth
                await user.DeleteAsync();

                await DisplayAlert("Cuenta eliminada", "Tu cuenta y tus datos han sido eliminados.", "OK");

                Preferences.Default.Clear();
                SecureStorage.Default.RemoveAll();
                await Shell.Current.GoToAsync("//MainPage");
            }
        }
        catch (Exception ex)
        {
            // Verificamos si el nombre del error contiene "FirebaseAuthException" 
            // sin mencionar la clase directamente para evitar el conflicto
            if (ex.GetType().Name.Contains("FirebaseAuthException"))
            {
                await DisplayAlert("Error de Acceso", "Credenciales incorrectas o problema de usuario.", "OK");
            }
            else
            {
                await DisplayAlert("Error", "Ocurrió un problema: " + ex.Message, "OK");
            }
        }
    }
}