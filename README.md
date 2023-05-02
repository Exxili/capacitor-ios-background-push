# @exxili/capacitor-ios-background-push

🚧 Work in Progress

Please note that this plugin is currently under active development and may be subject to changes or updates.

<hr>

A Capacitor plugin designed to handle iOS Silent Push notifications, enabling background updates, processing, and seamless integration with standard push notifications.


<docgen-index>

* [`register()`](#register)
* [`unregister()`](#unregister)
* [`addListener('remoteNotificationReceived', ...)`](#addlistenerremotenotificationreceived)
* [Interfaces](#interfaces)

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

### register()

```typescript
register() => Promise<void>
```

--------------------


### unregister()

```typescript
unregister() => Promise<void>
```

--------------------


### addListener('remoteNotificationReceived', ...)

```typescript
addListener(eventName: 'remoteNotificationReceived', listenerFunc: (data: { data: any; }) => void) => Promise<PluginListenerHandle> & PluginListenerHandle
```

Called when a silent push notification is received.

| Param              | Type                                           |
| ------------------ | ---------------------------------------------- |
| **`eventName`**    | <code>'remoteNotificationReceived'</code>      |
| **`listenerFunc`** | <code>(data: { data: any; }) =&gt; void</code> |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt; & <a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
