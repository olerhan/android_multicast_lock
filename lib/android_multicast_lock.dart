import 'package:flutter/foundation.dart';

import 'android_multicast_lock_platform_interface.dart';

class AndroidMulticastLock {
  Future<void> acquire() async {
    if ( defaultTargetPlatform == TargetPlatform.android )
        return AndroidMulticastLockPlatform.instance.acquire();
  }

  Future<void> release() async {
    if ( defaultTargetPlatform == TargetPlatform.android )
        return AndroidMulticastLockPlatform.instance.release();
  }

  Future<bool> isHeld() async {
    if ( defaultTargetPlatform == TargetPlatform.android )
        return AndroidMulticastLockPlatform.instance.isHeld();
    return false;
  }
}
