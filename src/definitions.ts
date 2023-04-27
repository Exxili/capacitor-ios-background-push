export interface IOSBackgroundPushPlugin {
  registerForRemoteNotifications(): Promise<void>;
  didReceiveRemoteNotification(options: { userInfo: any }): Promise<{ result: number }>;
  setupSilentPushListener(): Promise<void>;
}