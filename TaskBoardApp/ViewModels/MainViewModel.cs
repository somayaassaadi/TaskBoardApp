using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Devices;
using System.Collections.ObjectModel;
using TaskBoardApp.Models;
using TaskBoardApp.Services;

namespace TaskBoardApp.ViewModels
{
    public partial class MainViewModel : ObservableObject
    {
        private readonly INotificationService _notificationService;
        private readonly IConnectivityService _connectivityService;
        private readonly OfflineTaskService _offlineTaskService;

        [ObservableProperty]
        private string newTaskTitle;

        [ObservableProperty]
        private ObservableCollection<TaskItem> tasks = new();

        [ObservableProperty]
        private string platformMessage;

        public MainViewModel(
            INotificationService notificationService,
            IConnectivityService connectivityService,
            OfflineTaskService offlineTaskService)
        {
            _notificationService = notificationService;
            _connectivityService = connectivityService;
            _offlineTaskService = offlineTaskService;

            Tasks = new ObservableCollection<TaskItem>();

            // Détecter la plateforme (Android, iOS, etc.)
            DetectPlatform();

            // Charger les tâches sauvegardées depuis la base de données locale au démarrage
            LoadSavedTasks();

            // S'abonner aux changements de connectivité
            _connectivityService.ConnectivityChanged += OnConnectivityChanged;
        }

        private void DetectPlatform()
        {
            var platform = DeviceInfo.Platform;
            if (platform == DevicePlatform.Android)
                PlatformMessage = "Bienvenue sur Android ";
            else if (platform == DevicePlatform.iOS)
                PlatformMessage = "Bienvenue sur iOS ";
            else if (platform == DevicePlatform.WinUI)
                PlatformMessage = "Bienvenue sur Windows ";
            else
                PlatformMessage = "Bienvenue sur une autre plateforme.";
        }

        //charge la DB et remplit la liste affichée
        private async void LoadSavedTasks()
        {
            // Afficher un message pour indiquer que le chargement des tâches commence
            Console.WriteLine("Chargement des tâches depuis la base de données...");

            var saved = await _offlineTaskService.GetOfflineTasks();
            Tasks.Clear();

            // Vérifier si des tâches ont été récupérées
            if (saved.Count == 0)
            {
                Console.WriteLine("Aucune tâche trouvée dans la base de données.");
            }

            // Afficher chaque tâche récupérée depuis la base de données
            foreach (var task in saved)
            {
                Console.WriteLine($"Tâche chargée : {task.Title}"); // Afficher le titre de chaque tâche
                Tasks.Add(task);
            }
        }

        [RelayCommand]
        private async Task AddTask()
        {
            if (string.IsNullOrWhiteSpace(NewTaskTitle))
                return;

            var task = new TaskItem
            {
                Title = NewTaskTitle,
                IsCompleted = false
            };

            // Vérification si l'appareil est connecté à Internet
            if (_connectivityService.IsConnected)
            {
                //  EN LIGNE
                // Sauvegarder la tâche dans la base de données
                await _offlineTaskService.SaveOfflineTask(task);

                // Affichage dans la console pour vérifier l'ajout de la tâche
                Console.WriteLine($"Tâche ajoutée en ligne : {NewTaskTitle}");

                // Ajouter la tâche à la liste des tâches visibles
                Tasks.Add(task);

                // Notification pour l'utilisateur
                _notificationService.Show($"Tâche ajoutée en ligne : {NewTaskTitle}");
            }
            else
            {
                //  HORS-LIGNE
                // Sauvegarder seulement dans la base de données
                await _offlineTaskService.SaveOfflineTask(task);

                // Affichage dans la console pour vérifier l'ajout de la tâche
                Console.WriteLine($"Tâche sauvegardée localement (hors-ligne) : {NewTaskTitle}");

                // Notification pour l'utilisateur
                _notificationService.Show($"Tâche sauvegardée localement (hors-ligne) : {NewTaskTitle}");
            }

            // Réinitialisation du champ de texte
            NewTaskTitle = string.Empty;
        }

        [RelayCommand]
        private async Task RemoveTask(TaskItem task)
        {
            if (task == null)
                return;

            Tasks.Remove(task);

            if (task.Id != 0)
            {
                await _offlineTaskService.DeleteTask(task);
            }
            else
            {
               
            }
        }

        [RelayCommand]
        private async Task GoToStats()
        {
            await Shell.Current.GoToAsync("///StatsPage");

        }


        private async Task LoadOfflineTasks()
        {
            var offlineTasks = await _offlineTaskService.GetOfflineTasks();

            if (offlineTasks.Count == 0)
                return;

            foreach (var task in offlineTasks)
            {
                if (!Tasks.Any(t => t.Title == task.Title))
                {
                    Tasks.Add(task);
                }
            }

            await _offlineTaskService.ClearOfflineTasks();

            _notificationService.Show($"{offlineTasks.Count} tâche(s) synchronisée(s) !");
        }

        private async void OnConnectivityChanged(object sender, ConnectivityChangedEventArgs e)
        {
            if (e.NetworkAccess == NetworkAccess.Internet)
            {
                await App.Current.Dispatcher.DispatchAsync(async () =>
                {
                    await LoadOfflineTasks();
                });
            }
        }
    }
}
