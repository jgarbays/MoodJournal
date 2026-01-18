using MoodJournal.Models;

namespace MoodJournal.Services;

public interface IPersistenceStrategy
{
    Task<UserProfile> GetDataFromUserAsync(string userUid);
    Task<List<JournalEntry>> GetJournalEntriesAsync(string userUid);
    Task UpdateProfileAsync(string uid, Dictionary<string, object> updates);
    Task UpdateProfilePhotoAsync(string uid, string downloadUrl);


}
