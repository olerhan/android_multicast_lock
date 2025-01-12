import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_multicast_lock_method_channel.dart';

abstract class AndroidMulticastLockPlatform extends PlatformInterface {
  AndroidMulticastLockPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidMulticastLockPlatform _instance = MethodChannelAndroidMulticastLock();

  static AndroidMulticastLockPlatform get instance => _instance;

  static set instance(AndroidMulticastLockPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> acquire() {
    throw UnimplementedError('acquire() has not been implemented.');
  }

  Future<void> release() {
    throw UnimplementedError('release() has not been implemented.');
  }

  Future<bool> isHeld() {
    throw UnimplementedError('isHeld() has not been implemented.');
  }
}
