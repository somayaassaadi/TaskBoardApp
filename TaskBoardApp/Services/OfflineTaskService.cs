using Microsoft.EntityFrameworkCore;
using TaskBoardApp.Data;
using TaskBoardApp.Models;

namespace TaskBoardApp.Services
{
    public class OfflineTaskService
    {
        private readonly TaskDbContext _dbContext;

        public OfflineTaskService(TaskDbContext dbContext)
        {
            _dbContext = dbContext;
            _dbContext.Database.EnsureCreated();
        }

        public async Task SaveOfflineTask(TaskItem task)
        {
            await _dbContext.Tasks.AddAsync(task);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<List<TaskItem>> GetOfflineTasks()
        {
            return await _dbContext.Tasks.ToListAsync();
        }

        public async Task ClearOfflineTasks()
        {
            _dbContext.Tasks.RemoveRange(_dbContext.Tasks);
            await _dbContext.SaveChangesAsync();
        }

        public async Task DeleteTask(TaskItem task)
        {
            _dbContext.Tasks.Remove(task);
            await _dbContext.SaveChangesAsync();
        }
    }
}
