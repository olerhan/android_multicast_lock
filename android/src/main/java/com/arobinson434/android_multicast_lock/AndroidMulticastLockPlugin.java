package com.arobinson434.android_multicast_lock;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import android.content.Context;
import android.net.wifi.WifiManager;

public class AndroidMulticastLockPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;
  private WifiManager.MulticastLock mcast_lock;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    WifiManager wifi = (WifiManager) flutterPluginBinding.getApplicationContext()
                                           .getApplicationContext()
                                           .getSystemService(Context.WIFI_SERVICE);
    if ( wifi != null ) {
        mcast_lock = wifi.createMulticastLock("arobinson434_mcast_lock");
    }

    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "android_multicast_lock");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if ( mcast_lock == null ) {
      result.error("UNAVAILABLE", "MCast Lock not found", null);
    } else {
      try {
        if (call.method.equals("acquire")) {
          mcast_lock.acquire();
          result.success(null);
        } else if (call.method.equals("release")) {
          mcast_lock.release();
          result.success(null);
        } else if (call.method.equals("isHeld")) {
          result.success(mcast_lock.isHeld());
        }else {
          result.notImplemented();
        }
      } catch ( RuntimeException e ) {
        result.error("UNAVAILABLE", e.toString(), null);
      }
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
