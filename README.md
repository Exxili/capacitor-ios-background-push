# @exxili/capacitor-ios-background-push

A Capacitor plugin designed to handle iOS Silent Push notifications, enabling background updates, processing, and seamless integration with standard push notifications.


<docgen-index>

- [@exxili/capacitor-ios-background-push](#exxilicapacitor-ios-background-push)
  - [⚠️ iOS-specific Support](#️-ios-specific-support)
  - [🚀 Getting Started](#-getting-started)
  - [API](#api)
    - [registerForRemoteNotifications()](#registerforremotenotifications)
    - [didReceiveRemoteNotification(...)](#didreceiveremotenotification)
    - [setupSilentPushListener()](#setupsilentpushlistener)

</docgen-index>

## ⚠️ iOS-specific Support

This plugin is specifically designed for iOS and does not support Android. It handles Silent Push notifications on iOS devices, providing a seamless integration with standard push notifications.

## 🚀 Getting Started

Follow the steps below to integrate the plugin into your Capacitor project:

1. Install the plugin using npm:

```bash
npm install @exxili/capacitor-ios-background-push
```

2. Sync your Capacitor project:

```bash
npx cap sync
```

3. Add the following entry to the plugins array in your capacitor.config.json file:

```json
{
  "name": "IOSBackgroundPush",
  "package": "@exxili/capacitor-ios-background-push"
}
```

4. Import the plugin in your project and use it to listen for remote notifications:
   
```js
import { IOSBackgroundPush } from '@exxili/capacitor-ios-background-push';

// Register for remote notifications
IOSBackgroundPush.registerForRemoteNotifications();

// Set up a silent push listener
IOSBackgroundPush.setupSilentPushListener();

// Add a listener for silent push notifications
IOSBackgroundPush.addListener('silentPushReceived', (data) => {
  console.log('Silent push notification received:', data);
});
```

5. Update your AppDelegate.swift file in your iOS project to handle Silent Push notifications. Add the following method to your AppDelegate class:

```swift
import UIKit
import Capacitor

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // ... other existing code ...

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let plugin = bridge?.getOrLoadPlugin("IOSBackgroundPush") as? IOSBackgroundPush {
            plugin.didReceiveRemoteNotification([
                "userInfo": userInfo,
                "completionHandler": completionHandler
            ])
        } else {
            completionHandler(.failed)
        }
    }
}

```


## API


<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### registerForRemoteNotifications()

```typescript
registerForRemoteNotifications() => Promise<void>
```

--------------------


### didReceiveRemoteNotification(...)

```typescript
didReceiveRemoteNotification(options: { userInfo: any; }) => Promise<{ result: number; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ userInfo: any; }</code> |

**Returns:** <code>Promise&lt;{ result: number; }&gt;</code>

--------------------


### setupSilentPushListener()

```typescript
setupSilentPushListener() => Promise<void>
```

--------------------

</docgen-api>
