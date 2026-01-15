using Microcharts;
using SkiaSharp;
using Firebase.Auth;
using Google.Cloud.Firestore;


using MoodJournal.Models;
#if ANDROID
using Plugin.CloudFirestore;
#endif

namespace MoodJournal.Views;

public partial class Estadisticas : ContentPage
{
    private readonly FirebaseAuthClient _authClient;
    private readonly FirestoreDb _firestoreDb;
    private List<JournalEntry> _entradas = new();

    public Estadisticas(FirebaseAuthClient authClient, FirestoreDb firestoreDb = null)
    {
        InitializeComponent();
        _authClient = authClient;
        _firestoreDb = firestoreDb;
    }

    // Usamos OnAppearing para que cargue los datos en cuanto entres a la página
    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await CargarDatosDesdeFirebase();
    }

    private async Task CargarDatosDesdeFirebase()
    {
        try
        {
            string uid = _authClient.User?.Uid;
            if (string.IsNullOrEmpty(uid)) return;

#if ANDROID
            // --- LÓGICA PARA ANDROID (Plugin.CloudFirestore) ---
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

                _entradas.Add(entry);
            }
#else
            // --- LÓGICA PARA WINDOWS (Google.Cloud.Firestore) ---
            if (_firestoreDb != null)
            {
                Query query = _firestoreDb.Collection("usuarios")
                                          .Document(uid)
                                          .Collection("entradas")
                                          .OrderByDescending("fecha");

                QuerySnapshot snapshot = await query.GetSnapshotAsync();

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

                    _entradas.Add(entry);
                }
            }
#endif

            if (_entradas.Any())
            {
                Dispatcher.Dispatch(() =>
                {
                    ConfigurarGraficos();
                    GenerarResumenMensual();
                });
            }
            else
            {
                await DisplayAlert("Aviso", "No tienes entradas guardadas todavía.", "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", "Error al cargar estadísticas: " + ex.Message, "OK");
        }
    }

    private void ConfigurarGraficos()
    {
        // Gráfico Semana (Últimos 7 días registrados)
        var entriesSemana = _entradas
            .OrderByDescending(x => x.Fecha).Take(7).OrderBy(x => x.Fecha)
            .Select(x => new ChartEntry(ObtenerValorHumor(x.Humor))
            {
                Label = x.Fecha.ToString("dd/MM"),
                ValueLabel = x.Humor,
                Color = SKColor.Parse("#F49FB1")
            }).ToArray();

        ChartSemana.Chart = new LineChart
        {
            Entries = entriesSemana,
            LineMode = LineMode.Spline,
            LineSize = 8,
            PointMode = PointMode.Circle,
            PointSize = 18,
            MaxValue = 10,
            MinValue = 0,
            BackgroundColor = SKColors.Transparent,
        
        };

        // Gráfico Histórico (Promedio por mes)
        var entriesMeses = _entradas
            .GroupBy(x => new { x.Fecha.Year, x.Fecha.Month })
            .OrderByDescending(g => g.Key.Year).ThenByDescending(g => g.Key.Month)
            .Take(6).Reverse()
            .Select(g => new ChartEntry(g.Average(e => ObtenerValorHumor(e.Humor)))
            {
                Label = new DateTime(g.Key.Year, g.Key.Month, 1).ToString("MMM", new System.Globalization.CultureInfo("es-ES")),
                Color = SKColor.Parse("#F49FB1")
            }).ToArray();

        ChartSeisMeses.Chart = new LineChart
        {
            Entries = entriesMeses,
            LineMode = LineMode.Spline,
            LineSize = 8,
            PointMode = PointMode.None,
            MaxValue = 10,
            MinValue = 0,
            BackgroundColor = SKColors.Transparent,
            
        };
    }

    private float ObtenerValorHumor(string humor)
    {
        return humor?.ToLower() switch
        {
            
            "feliz" => 10,
            "contento" => 8,
            "meh" => 6,
            "nervioso" => 5,
            "enfadado" => 4,
            "triste" => 2,
            _ => 5
        };
    }

    private void GenerarResumenMensual()
    {
        if (_entradas == null || !_entradas.Any()) return;

        // 1. Título dinámico
        string nombreMes = DateTime.Now.ToString("MMMM", new System.Globalization.CultureInfo("es-ES"));
        LabelTituloMes.Text = $"en {nombreMes}:";

        // 2. Filtrar solo las del mes actual
        var entradasMes = _entradas.Where(x => x.Fecha.Month == DateTime.Now.Month &&
                                               x.Fecha.Year == DateTime.Now.Year).ToList();

        FlexResumen.Children.Clear();

        // 3. Agrupar por humor
        var estadisticas = entradasMes
            .GroupBy(x => x.Humor.ToLower())
            .Select(g => new {
                Humor = g.Key,
                Cantidad = g.Count(),
                Emoji = g.First().Emoji
            });

        foreach (var stats in estadisticas)
        {
            // Creamos un contenedor para cada humor
            var item = new VerticalStackLayout
            {
                Spacing = 2,
                WidthRequest = 90, // Un poco más ancho para que no se corten los textos
                Margin = new Thickness(5),
                HorizontalOptions = LayoutOptions.Center,
                Children = {
                new Label {
                    Text = stats.Emoji,
                    FontSize = 35,
                    HorizontalTextAlignment = TextAlignment.Center
                },
                new Label {
                    Text = stats.Humor,
                    FontSize = 12,
                    TextColor = Color.FromArgb("#BC5D4E"),
                    HorizontalTextAlignment = TextAlignment.Center
                },
                new Label {
                    Text = stats.Cantidad.ToString(),
                    FontSize = 30,
                    FontAttributes = FontAttributes.Bold,
                    TextColor = Color.FromArgb("#F49FB1"), // El rosa de tus gráficas
                    HorizontalTextAlignment = TextAlignment.Center
                },
                new Label {
                    Text = "días",
                    FontSize = 11,
                    TextColor = Color.FromArgb("#BC5D4E"),
                    HorizontalTextAlignment = TextAlignment.Center
                }
            }
            };

            FlexResumen.Children.Add(item);
        }
    }

    private async void OnBackTapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("//Home");

    }
}