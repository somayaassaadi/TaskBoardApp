using Microsoft.EntityFrameworkCore;
using TaskBoardApp.Models;
using System.IO;

namespace TaskBoardApp.Data
{
    public class TaskDbContext : DbContext
    {
        public DbSet<TaskItem> Tasks { get; set; }

        private string _databasePath;

        public TaskDbContext(string dbPath)
        {
            _databasePath = dbPath;

            // Afficher le chemin de la base de données
            Console.WriteLine($"Chemin de la base de données : {_databasePath}");

            if (File.Exists(_databasePath))
            {
                Console.WriteLine("La base de données existe déjà.");
            }
            else
            {
                Console.WriteLine("Création de la base de données.");
            }

            Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite($"Filename={_databasePath}");
        }
    }
}
