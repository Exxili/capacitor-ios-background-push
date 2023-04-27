import { WebPlugin } from '@capacitor/core';

import type { IOSBackgroundPushPlugin } from './definitions';

export class IOSBackgroundPushWeb extends WebPlugin implements IOSBackgroundPushPlugin {
  async registerForRemoteNotifications(): Promise<void> {
    console.warn('registerForRemoteNotifications is not supported on the web platform.');
  }

  async didReceiveRemoteNotification(_options: { userInfo: any }): Promise<{ result: number }> {
    console.warn('didReceiveRemoteNotification is not supported on the web platform.');
    return { result: 0 };
  }

  async setupSilentPushListener(): Promise<void> {
    console.warn('setupSilentPushListener is not supported on the web platform.');
  }
}