using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using TaskBoardApp.Services;

namespace TaskBoardApp.ViewModels;

public partial class StatsViewModel : ObservableObject
{
    private readonly OfflineTaskService _offlineTaskService;

    [ObservableProperty]
    private int totalTasks;

    [ObservableProperty]
    private double completionRate;

    public StatsViewModel()
    {
        _offlineTaskService = ServiceHelper.GetService<OfflineTaskService>();
        LoadStatsCommand = new AsyncRelayCommand(LoadStats);
        _ = LoadStats();
    }

    public IAsyncRelayCommand LoadStatsCommand { get; }

    private async Task LoadStats()
    {
        var tasks = await _offlineTaskService.GetOfflineTasks();

        TotalTasks = tasks.Count;

        if (TotalTasks == 0)
            CompletionRate = 0;
        else
            CompletionRate = 100.0 * tasks.Count(t => t.IsCompleted) / TotalTasks;
    }
}
