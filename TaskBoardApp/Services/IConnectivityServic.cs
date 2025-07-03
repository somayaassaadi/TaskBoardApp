using Microsoft.Maui.Networking;

namespace TaskBoardApp.Services
{
    public interface IConnectivityService
    {
        event EventHandler<ConnectivityChangedEventArgs> ConnectivityChanged;

        NetworkAccess NetworkAccess { get; }

        bool IsConnected { get; }
    }
}
