
using TaskBoardApp.Services;

namespace TaskBoardApp
{
    public partial class App : Application
    {
        public App(IServiceProvider serviceProvider)
        {
            InitializeComponent();

            // ✅ initialise ton helper pour le DI
            ServiceHelper.ServiceProvider = serviceProvider;

            MainPage = new AppShell();
        }
    }
}
