# android_multicast_lock

A Flutter plugin to manage an 
[Android Multicast Lock](https://developer.android.com/reference/android/net/wifi/WifiManager.MulticastLock).

## Example Usage
To see a crude example of using this plugin, look at `example/lib/main.dart`.

To include it in your project, add the following under `dependencies:` in
your projects pubspec.yaml:
```
  android_multicast_lock:
    git:
        url: https://github.com/arobinson434/android_multicast_lock
        ref: v1.0.0
```

## Testing
To test the `AndroidMulticastLock` object and it's method channel, run 
`flutter test` from the project root.

To test the top level plugin against a mock backend, run `flutter test` from
the `example/` directory.

Finally, to test with the platform plugin, run `flutter test integration_test`
from the `example/` directory while a device/emulator is connected.

