// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:android_multicast_lock_example/main.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:android_multicast_lock/android_multicast_lock_platform_interface.dart';

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
  AndroidMulticastLockPlatform.instance = MockAndroidMulticastLockPlatform();

  testWidgets('Verify Lock Held', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(Duration(seconds: 1));

    expect(
      find.text('Lock Held: true'),
      findsOneWidget
    );
  });
}
