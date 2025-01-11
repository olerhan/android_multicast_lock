
import 'android_multicast_lock_platform_interface.dart';

class AndroidMulticastLock {
  Future<String?> getPlatformVersion() {
    return AndroidMulticastLockPlatform.instance.getPlatformVersion();
  }
}
