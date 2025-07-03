using Microsoft.Maui.Networking;

namespace TaskBoardApp.Services
{
    public class ConnectivityService : IConnectivityService
    {
        public event EventHandler<ConnectivityChangedEventArgs> ConnectivityChanged
        {
            add => Connectivity.Current.ConnectivityChanged += value;
            remove => Connectivity.Current.ConnectivityChanged -= value;
        }

        public NetworkAccess NetworkAccess => Connectivity.Current.NetworkAccess;

        public bool IsConnected => Connectivity.Current.NetworkAccess == NetworkAccess.Internet;
    }
}
