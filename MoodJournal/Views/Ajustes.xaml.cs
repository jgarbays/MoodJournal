using System.ComponentModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;


namespace MoodJournal.Views;

public partial class Ajustes : ContentPage
{

    private const string ReminderTimeKey = "DailyReminderTime";
    private TimeSpan selectedReminderTime = new TimeSpan(19, 30, 0);

    public Ajustes()
    {
        InitializeComponent();
        LoadReminderTime(); // Agregado LoadReminderTime para que se ejecute al inicio
        // UpdateReminderTimeDisplay(selectedReminderTime); // Ya no se puede llamar directamente
    }

    // Método para regresar al menú
    private async void OnBackTapped(object sender, TappedEventArgs e)
    {
        await Navigation.PopAsync();
    }

    // Método auxiliar para formatear y mostrar la hora en el Label
    private void UpdateReminderTimeDisplay(TimeSpan time)
    {
        // NO PUEDES ACCEDER AL LABEL (ReminderTimeLabel) AHORA.
        // Lo dejaremos vacío hasta que se resuelva el error.
        // ReminderTimeLabel.Text = DateTime.Today.Add(time).ToString("hh:mm tt");
    }

    // Método de carga (No usa referencias UI, está bien)
    private void LoadReminderTime()
    {
        string savedTime = Preferences.Get(ReminderTimeKey, "19:30:00");

        if (TimeSpan.TryParse(savedTime, out TimeSpan time))
        {
            selectedReminderTime = time;
        }
        else
        {
            selectedReminderTime = new TimeSpan(19, 30, 0);
        }
    }


    // 1. Método llamado al tocar la etiqueta de la hora (Label)
    private async void OnReminderTimeTapped(object sender, EventArgs e)
    {
        HiddenTimePicker.Time = selectedReminderTime;

        // Introduce un pequeño retraso ANTES del foco
        await Task.Delay(50);

        // Forzar el foco de nuevo
        Dispatcher.Dispatch(() =>
        {
            HiddenTimePicker.Focus();
        });


    }


    // 2. Método llamado cuando el usuario selecciona una hora en el diálogo y pulsa OK
    private void OnTimePickerPropertyChanged(object sender, PropertyChangedEventArgs e)
    {
        // El único control accesible aquí es 'sender', pero el resto falla.
        if (e.PropertyName == nameof(TimePicker.Time))
        {
            TimePicker picker = (TimePicker)sender;
            TimeSpan nuevaHora = picker.Time;

            // 2. Comprobamos si la hora realmente cambió (para evitar ciclos)
            if (nuevaHora != selectedReminderTime)
            {
                selectedReminderTime = nuevaHora;
                // UpdateReminderTimeDisplay(nuevaHora); // NO ACCESIBLE

                // 3. Reprogramamos si el Switch está encendido
                // if (ReminderSwitch.IsToggled) // NO ACCESIBLE
                // {
                Preferences.Set(ReminderTimeKey, nuevaHora.ToString()); // ¡Guardar si funciona!
                                                                        //     DisplayAlert("Hora Actualizada", "Recordatorio actualizado.", "OK");
                                                                        // }
            }
        }
    }

    // 3. Lógica del Switch para activar/desactivar notificaciones
    private void OnReminderToggled(object sender, ToggledEventArgs e)
    {
        // NO PUEDES ACCEDER AL SWITCH (ReminderSwitch) AHORA, ¡pero este evento es disparado por él!
        if (e.Value) // True: Activar
        {
            // TODO: Llamar a ScheduleDailyNotification(selectedReminderTime);
            // DisplayAlert("Recordatorio", $"Recordatorio diario activado a las {ReminderTimeLabel.Text}.", "OK"); // NO ACCESIBLE
        }
        else // False: Desactivar
        {
            // TODO: Llamar a CancelScheduledNotification(); 
            // DisplayAlert("Recordatorio", "Recordatorio diario desactivado.", "OK");
        }
    }
}