
import 'android_multicast_lock_platform_interface.dart';

class AndroidMulticastLock {
  Future<void> acquire() {
    return AndroidMulticastLockPlatform.instance.acquire();
  }

  Future<void> release() {
    return AndroidMulticastLockPlatform.instance.release();
  }

  Future<bool> isHeld() {
    return AndroidMulticastLockPlatform.instance.isHeld();
  }
}
