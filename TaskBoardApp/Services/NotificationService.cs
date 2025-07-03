using Microsoft.Maui.Controls;
using TaskBoardApp.Services;

namespace TaskBoardApp.Services
{
    public class NotificationService : INotificationService
    {
        public void Show(string message)
        {
#if ANDROID
            Android.Widget.Toast.MakeText(
                Android.App.Application.Context,
                message,
                Android.Widget.ToastLength.Long
            )?.Show();
#elif IOS
            var alert = new UIKit.UIAlertController
            {
                Title = "Notification",
                Message = message,
            };
            alert.AddAction(UIKit.UIAlertAction.Create("OK", UIKit.UIAlertActionStyle.Default, null));

            var controller = UIKit.UIApplication.SharedApplication.KeyWindow.RootViewController;
            controller?.PresentViewController(alert, true, null);
#elif WINDOWS
            var dialog = new Microsoft.UI.Xaml.Controls.ContentDialog
            {
                Title = "Notification",
                Content = message,
                CloseButtonText = "OK"
            };

            var hwnd = WinRT.Interop.WindowNative.GetWindowHandle(App.Current.Windows[0].Handler.PlatformView);
            WinRT.Interop.InitializeWithWindow.Initialize(dialog, hwnd);
            dialog.ShowAsync();
#else
            Application.Current.MainPage.DisplayAlert("Notification", message, "OK");
#endif
        }
    }
}
