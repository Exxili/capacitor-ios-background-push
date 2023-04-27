import { registerPlugin } from '@capacitor/core';

import type { IOSBackgroundPushPlugin } from './definitions';

const IOSBackgroundPush = registerPlugin<IOSBackgroundPushPlugin>('IOSBackgroundPush', {
  web: () => import('./web').then(m => new m.IOSBackgroundPushWeb()),
});

export * from './definitions';
export { IOSBackgroundPush };
