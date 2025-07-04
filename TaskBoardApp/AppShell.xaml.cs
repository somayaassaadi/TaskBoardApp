using TaskBoardApp.Views;

namespace TaskBoardApp
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute("StatsPage", typeof(StatsPage));

        }
    }
}
