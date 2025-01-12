import 'package:flutter_test/flutter_test.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';
import 'package:android_multicast_lock/android_multicast_lock_platform_interface.dart';
import 'package:android_multicast_lock/android_multicast_lock_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidMulticastLockPlatform
    with MockPlatformInterfaceMixin
    implements AndroidMulticastLockPlatform {

  static bool lock_set = false;

  @override
  Future<void> acquire() async {
    lock_set = true;
  }

  @override
  Future<void> release()  async{
    lock_set = false;
  }

  @override
  Future<bool> isHeld() => Future.value(lock_set);
}

void main() {
  final AndroidMulticastLockPlatform initialPlatform = AndroidMulticastLockPlatform.instance;

  test('$MethodChannelAndroidMulticastLock is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidMulticastLock>());
  });

  test('acquireTest', () async {
    AndroidMulticastLock androidMulticastLockPlugin = AndroidMulticastLock();
    MockAndroidMulticastLockPlatform fakePlatform = MockAndroidMulticastLockPlatform();
    AndroidMulticastLockPlatform.instance = fakePlatform;

    expect(await androidMulticastLockPlugin.isHeld(), false);
    androidMulticastLockPlugin.acquire();
    expect(await androidMulticastLockPlugin.isHeld(), true);
  });

  test('releaseTest', () async {
    AndroidMulticastLock androidMulticastLockPlugin = AndroidMulticastLock();
    MockAndroidMulticastLockPlatform fakePlatform = MockAndroidMulticastLockPlatform();
    AndroidMulticastLockPlatform.instance = fakePlatform;

    expect(await androidMulticastLockPlugin.isHeld(), true);
    androidMulticastLockPlugin.release();
    expect(await androidMulticastLockPlugin.isHeld(), false);
  });
}
