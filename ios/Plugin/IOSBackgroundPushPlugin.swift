import Capacitor
import Foundation

@objc(IOSBackgroundPushPlugin)
public class IOSBackgroundPushPlugin: CAPPlugin {
    // private let backgroundPushHandler = IOSBackgroundPush()

    override public func load() {
        // backgroundPushHandler.plugin = self
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveRemoteNotification(notification:)), name: .didReceiveRemoteNotificationForIOSBackgroundPush, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func didReceiveRemoteNotification(notification: Notification) {
        guard let userInfo = notification.userInfo?["userInfo"] as? [AnyHashable: Any],
            let completionHandler = notification.userInfo?["completionHandler"] as? (UIBackgroundFetchResult) -> Void else {
            return
        }

        // Handle the remote notification here
        // Perform your tasks within 30 seconds and call the provided completion handler.
            
        // Notify the JavaScript side
        self.notifyListeners("BgNotificationReceived", data: [
            "userInfo": userInfo,
        ], retainUntilConsumed: true)

        // Call the completion handler with the appropriate result
        completionHandler(.newData)
    }

}

public extension Notification.Name {
    static let didReceiveRemoteNotificationForIOSBackgroundPush = Notification.Name("didReceiveRemoteNotificationForIOSBackgroundPush")
}
