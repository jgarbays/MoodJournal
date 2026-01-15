namespace MoodJournal.Models;
    public class JournalEntry
{
    public string Id { get; set; }
    private string _humor;
    public string Humor
    {
        get => _humor ?? "indefinido"; // Si es null, devuelve un texto
        set => _humor = value;
    }
    public string Contenido { get; set; }
    public DateTime Fecha { get; set; }

    public string FechaCompleta => Fecha.ToString("dd 'de' MMMM, yyyy");

    public string MesAnio => Fecha.ToString("MMMM yyyy"); 

    // Propiedades calculadas para la interfaz
    public string Dia => Fecha.ToString("dd");
    public string Mes => Fecha.ToString("MMM").ToLower();
    public string Emoji => Humor switch
    {
        "feliz" => "😄",
        "contento" => "🙂",
        "meh" => "😐",
        "nervioso" => "😨",
        "enfadado" => "😡",
        "triste" => "😟",
        _ => "😶"
    };
}
