import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_multicast_lock/android_multicast_lock_method_channel.dart';

void main() {
  bool lock_held = false;
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<Object?> handler(MethodCall call) async {
    if ( call.method == "acquire" )
      lock_held = true;
    else if ( call.method == "release" )
      lock_held = false;
    else if ( call.method == "isHeld" )
      return lock_held;
  }

  MethodChannelAndroidMulticastLock platform = MethodChannelAndroidMulticastLock();
  const MethodChannel channel = MethodChannel('android_multicast_lock');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel, handler);
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel, null);
  });

  test('acquireChannelTest', () async {
    expect(await platform.isHeld(), false);
    platform.acquire();
    expect(await platform.isHeld(), true);
  });

  test('releaseChannelTest', () async {
    expect(await platform.isHeld(), true);
    platform.release();
    expect(await platform.isHeld(), false);
  });
}
