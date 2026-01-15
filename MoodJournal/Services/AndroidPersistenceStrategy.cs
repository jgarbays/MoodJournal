using MoodJournal.Models;
using Plugin.CloudFirestore;

namespace MoodJournal.Services;

public class AndroidPersistenceStrategy : IPersistenceStrategy
{
    public Task<UserProfile> GetDataFromUserAsync(string userUid)
    {
        throw new NotImplementedException();
    }

    public async Task<List<JournalEntry>> GetJournalEntriesAsync(string uid)
    {
        // --- LÓGICA PARA ANDROID (Plugin Nativo) ---
        var querySnapshot = await CrossCloudFirestore.Current
                                    .Instance
                                    .Collection("usuarios")
                                    .Document(uid)
                                    .Collection("entradas")
                                    .OrderBy("fecha", descending: true)
                                    .GetAsync();
        var entries = 
            new List<JournalEntry>();
        foreach (var doc in querySnapshot.Documents)
        {
            var data = doc.Data;
            DateTime fechaReal;

            try
            {
                // Esta es la forma oficial del plugin para mapear Timestamps de Android a DateTime de C#
                fechaReal = doc.Get<DateTime>("fecha");
            }
            catch (Exception)
            {
                // Si falla, intentamos extraer los segundos manualmente (Plan B extremo)
                try
                {
                    // A veces el plugin entrega un objeto que se puede convertir a Plugin.CloudFirestore.Timestamp
                    var ts = doc.Get<Plugin.CloudFirestore.Timestamp>("fecha");
                    fechaReal = ts.ToDateTime();
                }
                catch
                {
                    fechaReal = DateTime.Now; // Último recurso
                }
            }
            var entry = new JournalEntry
            {
                Id = doc.Id,
                Humor = data.ContainsKey("humor") ? data["humor"]?.ToString() : "indefinido",
                Contenido = data.ContainsKey("contenido") ? data["contenido"]?.ToString() : "",
                // El Plugin de Android devuelve las fechas directamente como DateTime o Timestamp nativo
                Fecha = fechaReal
            };

           
            entries.Add(entry);
        }
        return entries;
    }
}