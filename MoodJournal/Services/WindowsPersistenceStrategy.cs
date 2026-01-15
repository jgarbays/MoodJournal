using Google.Cloud.Firestore;
using MoodJournal.Models;

namespace MoodJournal.Services;

public class WindowsPersistenceStrategy : IPersistenceStrategy
{
    private readonly FirestoreDb _firestoreDb;
    public WindowsPersistenceStrategy(FirestoreDb firestoreDb)
    {
        this._firestoreDb = firestoreDb;
    }


    public Task<UserProfile> GetDataFromUserAsync(string userUid)
    {
        throw new NotImplementedException();
    }


    public async Task<List<JournalEntry>> GetJournalEntriesAsync(string uid)
    {

        Query query = _firestoreDb.Collection("usuarios").Document(uid)
                                  .Collection("entradas")
                                  .OrderByDescending("fecha");

        QuerySnapshot snapshot = await query.GetSnapshotAsync();
         
        var _todasLasEntradas = new List<JournalEntry>();
        foreach (DocumentSnapshot doc in snapshot.Documents)
        {
            Dictionary<string, object> data = doc.ToDictionary();
            var entry = new JournalEntry
            {
                Id = doc.Id,
                Humor = data.ContainsKey("humor") ? data["humor"]?.ToString() : "indefinido",
                Contenido = data.ContainsKey("contenido") ? data["contenido"]?.ToString() : "",
                Fecha = data.ContainsKey("fecha") ? ((Timestamp)data["fecha"]).ToDateTime() : DateTime.Now
            };
            _todasLasEntradas.Add(entry);
        }
        return _todasLasEntradas;
    }
}
