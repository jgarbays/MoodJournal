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
        var entries = new List<JournalEntry>();
        foreach (var doc in querySnapshot.Documents)
        {
            var data = doc.Data;
            var entry = new JournalEntry
            {
                Id = doc.Id,
                Humor = data.ContainsKey("humor") ? data["humor"]?.ToString() : "indefinido",
                Contenido = data.ContainsKey("contenido") ? data["contenido"]?.ToString() : "",
                // El Plugin de Android devuelve las fechas directamente como DateTime o Timestamp nativo
                Fecha = data.ContainsKey("fecha") ? Convert.ToDateTime(data["fecha"]) : DateTime.Now
            };
            entries.Add(entry);
        }
        return entries;
    }
}