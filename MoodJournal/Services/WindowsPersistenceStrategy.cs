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


    public async Task<UserProfile> GetDataFromUserAsync(string userUid)
    {
        if (_firestoreDb == null)
            return null;

        DocumentReference docRef = _firestoreDb
            .Collection("usuarios")
            .Document(userUid);

        DocumentSnapshot snapshot = await docRef.GetSnapshotAsync();

        if (!snapshot.Exists)
            return null;

        Dictionary<string, object> userData = snapshot.ToDictionary();

        UserProfile userProfile = new UserProfile
        {
            Uid = userUid,

            nombre_usuario = userData.ContainsKey("nombre_usuario")
                ? userData["nombre_usuario"]?.ToString()
                : null,

            email = userData.ContainsKey("email")
                ? userData["email"]?.ToString()
                : null,

            telefono = userData.ContainsKey("telefono")
                ? userData["telefono"]?.ToString()
                : null,

            fecha_nacimiento = userData.ContainsKey("fecha_nacimiento")
                ? userData["fecha_nacimiento"]?.ToString()
                : null,

            foto_url = userData.ContainsKey("foto_url")
                ? userData["foto_url"]?.ToString()
                : null
        };

        return userProfile;
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

    public async Task UpdateProfileAsync(string uid, Dictionary<string, object> updates)
    {
        DocumentReference docRef = _firestoreDb
            .Collection("usuarios")
            .Document(uid);

        await docRef.UpdateAsync(updates);
    }

    public async Task UpdateProfilePhotoAsync(string uid, string downloadUrl)
    {
        if (_firestoreDb != null)
        {   //Creamos referencia al documento de usuario
            DocumentReference docRef =
                _firestoreDb.Collection("usuarios").Document(uid);
            //Actualizamos el campo de la url de la foto de este documento con la nueva url
            await docRef.UpdateAsync("foto_url", downloadUrl);
        }
    }

    public async Task DeleteAccountAsync(string uid)
    {
        if (_firestoreDb != null)
        {
            DocumentReference docRef =
                _firestoreDb.Collection("usuarios").Document(uid);
            await docRef.DeleteAsync();
        }
    }

    public async Task CreateAccountAsync(string uid, Dictionary<string, object> userData)
    {
        if (_firestoreDb != null)
        {
            DocumentReference docRef =
                _firestoreDb.Collection("usuarios").Document(uid);
            await docRef.SetAsync(userData);
        }
    }

    public async Task UploadEntry(string uid, Dictionary<string, object> entry)
    {
        if (_firestoreDb != null)
        {
            CollectionReference entriesRef =
                _firestoreDb.Collection("usuarios").Document(uid)
                            .Collection("entradas");
            await entriesRef.AddAsync(entry);
        }
    }
}
