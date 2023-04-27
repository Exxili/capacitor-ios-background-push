# @exxili/capacitor-ios-background-push

Handles iOS Silent Push notifications for Capacitor apps, enabling background updates, processing, and seamless integration with standard push notifications.

## Install

```bash
npm install @exxili/capacitor-ios-background-push
npx cap sync
```

## API

<docgen-index>

* [`registerForRemoteNotifications()`](#registerforremotenotifications)
* [`didReceiveRemoteNotification(...)`](#didreceiveremotenotification)
* [`setupSilentPushListener()`](#setupsilentpushlistener)

</docgen-index>

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
