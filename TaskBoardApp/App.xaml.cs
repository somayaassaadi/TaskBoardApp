
using TaskBoardApp.Services;

namespace TaskBoardApp
{
    public partial class App : Application
    {
        public App(IServiceProvider serviceProvider)
        {
            InitializeComponent();

            ServiceHelper.ServiceProvider = serviceProvider;

            MainPage = new AppShell();
        }
    }
}
