import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool lock_held = false;

  @override
  void initState() {
    super.initState();
    AndroidMulticastLock().acquire();

    setup();
  }

  @override
  void dispose() {
    AndroidMulticastLock().release();
    super.dispose();
  }

  Future<void> setup() async {
    final bool? _lock_held = await AndroidMulticastLock().isHeld();

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      lock_held = _lock_held ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Lock Held: $lock_held'),
        ),
      ),
    );
  }
}
