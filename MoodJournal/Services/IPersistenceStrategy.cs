using MoodJournal.Models;

namespace MoodJournal.Services;

public interface IPersistenceStrategy
{
    Task<UserProfile> GetDataFromUserAsync(string userUid);
    Task<List<JournalEntry>> GetJournalEntriesAsync(string userUid);
}
