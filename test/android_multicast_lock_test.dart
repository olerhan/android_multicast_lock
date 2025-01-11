import 'package:flutter_test/flutter_test.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';
import 'package:android_multicast_lock/android_multicast_lock_platform_interface.dart';
import 'package:android_multicast_lock/android_multicast_lock_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidMulticastLockPlatform
    with MockPlatformInterfaceMixin
    implements AndroidMulticastLockPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidMulticastLockPlatform initialPlatform = AndroidMulticastLockPlatform.instance;

  test('$MethodChannelAndroidMulticastLock is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidMulticastLock>());
  });

  test('getPlatformVersion', () async {
    AndroidMulticastLock androidMulticastLockPlugin = AndroidMulticastLock();
    MockAndroidMulticastLockPlatform fakePlatform = MockAndroidMulticastLockPlatform();
    AndroidMulticastLockPlatform.instance = fakePlatform;

    expect(await androidMulticastLockPlugin.getPlatformVersion(), '42');
  });
}
