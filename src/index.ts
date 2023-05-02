import { registerPlugin } from '@capacitor/core';

import type { IOSBackgroundPushPlugin } from './definitions';

const IOSBackgroundPush = registerPlugin<IOSBackgroundPushPlugin>(
  'IOSBackgroundPush', 
  {}
);

export * from './definitions';
export { IOSBackgroundPush };
