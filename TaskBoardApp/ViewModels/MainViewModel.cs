using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using TaskBoardApp.Models;

namespace TaskBoardApp.ViewModels
{
    public partial class MainViewModel : ObservableObject
    {
        [ObservableProperty]
        private string newTaskTitle;

        [ObservableProperty]
        private ObservableCollection<TaskItem> tasks = new();

        public MainViewModel()
        {
            // pas besoin d'initialiser les commandes explicitement
        }

        [RelayCommand]
        private void AddTask()
        {
            if (string.IsNullOrWhiteSpace(NewTaskTitle))
                return;

            var task = new TaskItem
            {
                Title = NewTaskTitle,
                IsCompleted = false
            };

            Tasks.Add(task);
            NewTaskTitle = string.Empty;
        }

        [RelayCommand]
        private void RemoveTask(TaskItem task)
        {
            if (task != null && Tasks.Contains(task))
                Tasks.Remove(task);
        }
    }
}
