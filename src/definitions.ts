import type { PluginListenerHandle } from '@capacitor/core';

export interface IOSBackgroundPushPlugin {

  // register(): Promise<void>;

  // unregister(): Promise<void>;

  /**
   * Called when a silent push notification is received.
   * @param eventName 
   * @param listenerFunc 
   */
  addListener(
    eventName: 'SilentNotificationReceived',
    listenerFunc: (data: { data: any }) => void,
  ): Promise<PluginListenerHandle> & PluginListenerHandle
}