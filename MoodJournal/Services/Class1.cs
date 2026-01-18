
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Maui.Storage;
using MoodJournal.Models;

namespace MoodJournal.Services;

public class FilePersistenceStrategy : IPersistenceStrategy
{
    private readonly string _baseDir;
    private readonly SemaphoreSlim _semaphore = new(1, 1);
    private readonly JsonSerializerOptions _jsonOptions = new() { WriteIndented = true };

    public FilePersistenceStrategy()
    {
        _baseDir = Path.Combine(FileSystem.AppDataDirectory, "moodjournal_data");
        Directory.CreateDirectory(_baseDir);
    }

    // USERS store: users.json -> Dictionary<string, UserProfile>
    private string UsersFilePath => Path.Combine(_baseDir, "users.json");
    private string EntriesFilePath(string uid) => Path.Combine(_baseDir, $"entries_{uid}.json");

    public async Task<UserProfile> GetDataFromUserAsync(string userUid)
    {
        if (string.IsNullOrWhiteSpace(userUid)) return null!;
        await _semaphore.WaitAsync();
        try
        {
            var users = await ReadUsersAsync();
            if (users.TryGetValue(userUid, out var profile))
                return profile;
            return new UserProfile { Uid = userUid, nombre_usuario = string.Empty, email = string.Empty, foto_url = string.Empty, fecha_nacimiento = string.Empty, telefono = string.Empty };
        }
        finally
        {
            _semaphore.Release();
        }
    }

    public async Task<List<JournalEntry>> GetJournalEntriesAsync(string userUid)
    {
        if (string.IsNullOrWhiteSpace(userUid)) return new List<JournalEntry>();
        await _semaphore.WaitAsync();
        try
        {
            var path = EntriesFilePath(userUid);
            if (!File.Exists(path)) return new List<JournalEntry>();
            var json = await File.ReadAllTextAsync(path);
            var list = JsonSerializer.Deserialize<List<JournalEntry>>(json, _jsonOptions);
            return list ?? new List<JournalEntry>();
        }
        finally
        {
            _semaphore.Release();
        }
    }

    public async Task UpdateProfileAsync(string uid, Dictionary<string, object> updates)
    {
        if (string.IsNullOrWhiteSpace(uid) || updates == null) return;
        await _semaphore.WaitAsync();
        try
        {
            var users = await ReadUsersAsync();
            if (!users.TryGetValue(uid, out var profile))
                profile = new UserProfile { Uid = uid };

            foreach (var kv in updates)
            {
                var key = kv.Key?.ToLowerInvariant();
                var val = kv.Value?.ToString() ?? string.Empty;
                switch (key)
                {
                    case "nombre_usuario":
                    case "nombre":
                    case "username":
                        profile.nombre_usuario = val;
                        break;
                    case "email":
                        profile.email = val;
                        break;
                    case "foto_url":
                    case "photo":
                        profile.foto_url = val;
                        break;
                    case "fecha_nacimiento":
                    case "birthdate":
                        profile.fecha_nacimiento = val;
                        break;
                    case "telefono":
                    case "phone":
                        profile.telefono = val;
                        break;
                    default:
                        // Ignorar campos desconocidos
                        break;
                }
            }

            users[uid] = profile;
            await WriteUsersAsync(users);
        }
        finally
        {
            _semaphore.Release();
        }
    }

    public async Task UpdateProfilePhotoAsync(string uid, string downloadUrl)
    {
        if (string.IsNullOrWhiteSpace(uid)) return;
        await _semaphore.WaitAsync();
        try
        {
            var users = await ReadUsersAsync();
            if (!users.TryGetValue(uid, out var profile))
                profile = new UserProfile { Uid = uid };

            profile.foto_url = downloadUrl ?? string.Empty;
            users[uid] = profile;
            await WriteUsersAsync(users);
        }
        finally
        {
            _semaphore.Release();
        }
    }

    public async Task CreateAccountAsync(string uid, Dictionary<string, object> userdata)
    {
        if (string.IsNullOrWhiteSpace(uid)) return;
        await _semaphore.WaitAsync();
        try
        {
            var users = await ReadUsersAsync();
            var profile = new UserProfile
            {
                Uid = uid,
                nombre_usuario = userdata.TryGetValue("nombre_usuario", out var n) ? n?.ToString() ?? string.Empty : string.Empty,
                email = userdata.TryGetValue("email", out var e) ? e?.ToString() ?? string.Empty : string.Empty,
                foto_url = userdata.TryGetValue("foto_url", out var f) ? f?.ToString() ?? string.Empty : string.Empty,
                fecha_nacimiento = userdata.TryGetValue("fecha_nacimiento", out var d) ? d?.ToString() ?? string.Empty : string.Empty,
                telefono = userdata.TryGetValue("telefono", out var t) ? t?.ToString() ?? string.Empty : string.Empty
            };
            users[uid] = profile;
            await WriteUsersAsync(users);
        }
        finally
        {
            _semaphore.Release();
        }
    }

    public async Task DeleteAccountAsync(string uid)
    {
        if (string.IsNullOrWhiteSpace(uid)) return;
        await _semaphore.WaitAsync();
        try
        {
            var users = await ReadUsersAsync();
            if (users.Remove(uid))
                await WriteUsersAsync(users);

            var entriesPath = EntriesFilePath(uid);
            if (File.Exists(entriesPath))
                File.Delete(entriesPath);
        }
        finally
        {
            _semaphore.Release();
        }
    }

    public async Task UploadEntry(string uid, Dictionary<string, object> entry)
    {
        if (string.IsNullOrWhiteSpace(uid) || entry == null) return;
        await _semaphore.WaitAsync();
        try
        {
            var list = await GetJournalEntriesAsync(uid);

            var je = new JournalEntry
            {
                Id = Guid.NewGuid().ToString(),
                Humor = entry.TryGetValue("Humor", out var h) ? h?.ToString() ?? string.Empty : entry.TryGetValue("humor", out var hh) ? hh?.ToString() ?? string.Empty : string.Empty,
                Contenido = entry.TryGetValue("Contenido", out var c) ? c?.ToString() ?? string.Empty : entry.TryGetValue("contenido", out var cc) ? cc?.ToString() ?? string.Empty : string.Empty,
                Fecha = entry.TryGetValue("Fecha", out var f) && DateTime.TryParse(f?.ToString(), out var dt) ? dt : DateTime.UtcNow
            };

            //je.FechaCompleta = je.Fecha.ToString("s");
            //je.MesAnio = je.Fecha.ToString("MM-yyyy");
            //je.Dia = je.Fecha.Day.ToString();
            //je.Mes = je.Fecha.ToString("MMM");
            //je.Emoji = GetEmojiFromHumor(je.Humor);

            list.Add(je);

            var path = EntriesFilePath(uid);
            var json = JsonSerializer.Serialize(list, _jsonOptions);
            await File.WriteAllTextAsync(path, json);
        }
        finally
        {
            _semaphore.Release();
        }
    }

    // ---- helpers ----
    private async Task<Dictionary<string, UserProfile>> ReadUsersAsync()
    {
        var path = UsersFilePath;
        if (!File.Exists(path)) return new Dictionary<string, UserProfile>();
        var json = await File.ReadAllTextAsync(path);
        try
        {
            var dict = JsonSerializer.Deserialize<Dictionary<string, UserProfile>>(json, _jsonOptions);
            return dict ?? new Dictionary<string, UserProfile>();
        }
        catch
        {
            return new Dictionary<string, UserProfile>();
        }
    }

    private async Task WriteUsersAsync(Dictionary<string, UserProfile> users)
    {
        var json = JsonSerializer.Serialize(users, _jsonOptions);
        await File.WriteAllTextAsync(UsersFilePath, json);
    }

    private static string GetEmojiFromHumor(string humor)
    {
        if (string.IsNullOrWhiteSpace(humor)) return "😐";
        var h = humor.ToLowerInvariant();
        if (h.Contains("feliz") || h.Contains("content")) return "😃";
        if (h.Contains("triste") || h.Contains("deprim")) return "😢";
        if (h.Contains("enoj") || h.Contains("rabia")) return "😠";
        if (h.Contains("ans") || h.Contains("nerv")) return "😰";
        if (h.Contains("sorp") || h.Contains("sorpr")) return "😮";
        return "🙂";
    }
}