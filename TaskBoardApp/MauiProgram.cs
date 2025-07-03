using Microsoft.Extensions.Logging;
using TaskBoardApp.Data;
using TaskBoardApp.Services;
using TaskBoardApp.ViewModels;
using TaskBoardApp.Views;

namespace TaskBoardApp
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
            builder.Logging.AddDebug();
#endif

            // ✅ Enregistrer la DB path pour DI
            var dbPath = Path.Combine(FileSystem.AppDataDirectory, "tasks.db3");
            builder.Services.AddSingleton(dbPath);

            // ✅ Enregistrer les services
            builder.Services.AddSingleton<INotificationService, NotificationService>();
            builder.Services.AddSingleton<IConnectivityService, ConnectivityService>();
            builder.Services.AddSingleton<TaskDbContext>();
            builder.Services.AddSingleton<OfflineTaskService>();
            builder.Services.AddSingleton<MainViewModel>();
            builder.Services.AddSingleton<MainPage>();
            builder.Services.AddTransient<StatsPage>();

            return builder.Build();
        }
    }
}
