import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_multicast_lock_platform_interface.dart';

/// An implementation of [AndroidMulticastLockPlatform] that uses method channels.
class MethodChannelAndroidMulticastLock extends AndroidMulticastLockPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_multicast_lock');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
