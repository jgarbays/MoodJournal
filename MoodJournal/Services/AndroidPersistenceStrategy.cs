using Firebase.Auth;
using MoodJournal.Models;
using Plugin.CloudFirestore;

namespace MoodJournal.Services;

public class AndroidPersistenceStrategy : IPersistenceStrategy
{
    private readonly object _authClient;

    public async Task<UserProfile> GetDataFromUserAsync(string userId)
    {
        var snapshot = await CrossCloudFirestore.Current
            .Instance
            .Collection("usuarios")
            .Document(userId)
            .GetAsync();

        if (!snapshot.Exists)
            return null;

        var userData = snapshot.Data;

        UserProfile profile = new UserProfile
        {
            Uid = userId,

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

        return profile;
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

    public async Task UpdateProfileAsync(string uid, Dictionary<string, object> updates)
    {
    
        await CrossCloudFirestore.Current
            .Instance
            .Collection("usuarios")
            .Document(uid)
            .UpdateAsync(updates);
    }

    public async Task UpdateProfilePhotoAsync(string uid, string downloadUrl)
    {
        await CrossCloudFirestore.Current
                       .Instance
                       .Collection("usuarios")
                       .Document(uid)
                       //Recibe un diccionario de campos
                       .UpdateAsync(new Dictionary<string, object>
                       {
        { "foto_url", downloadUrl } //Actualiza solo el campo que contiene la url de la foto
                       });

    }

    public async Task DeleteAccountAsync(string uid)
    {
        await CrossCloudFirestore.Current.Instance
                       .Collection("usuarios").Document(uid).DeleteAsync();
    }

    public async Task CreateAccountAsync(string uid, Dictionary<string, object> userdata)
    {
        await CrossCloudFirestore.Current
           .Instance
           .Collection("usuarios")
           .Document(uid)
           .SetAsync(userdata);
    }

    public async Task UploadEntry(string uid, Dictionary<string, object> entry)
    {
        await CrossCloudFirestore.Current
            .Instance
            .Collection("usuarios")
            .Document(uid)
            .Collection("entradas")
            .AddAsync(entry);
    }


}

