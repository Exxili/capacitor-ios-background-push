import Capacitor
import Foundation

@objc(IOSBackgroundPush)
public class IOSBackgroundPush: CAPPlugin {

    @objc func registerForRemoteNotifications(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
        call.success()
    }

    @objc func didReceiveRemoteNotification(_ call: CAPPluginCall) {
        let userInfo = call.getObject("userInfo") as? [AnyHashable: Any] ?? [:]
        let completionHandler: ((UIBackgroundFetchResult) -> Void) = { result in
            call.resolve([
                "result": result.rawValue
            ])
        }

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.didReceiveRemoteNotification(userInfo: userInfo, completionHandler: completionHandler)
        } else {
            call.reject("Failed to retrieve AppDelegate")
        }
    }

    @objc func setupSilentPushListener(_ call: CAPPluginCall) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleSilentPushNotification(_:)), name: Notification.Name("SilentPushNotification"), object: nil)
        call.success()
    }

    @objc private func handleSilentPushNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String: Any],
           let completionHandler = userInfo["completionHandler"] as? (UIBackgroundFetchResult) -> Void {
            notifyListeners("silentPushReceived", data: userInfo)
            completionHandler(.newData)
        }
    }
}
