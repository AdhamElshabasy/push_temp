import 'dart:developer';
import 'package:flutter/services.dart';

//-------------------------------------------------------------------------//

class BatteryService {
  static const MethodChannel _channel = MethodChannel('battery_info');

  static Future<int> getBatteryLevel() async {
    try {
      final int batteryLevel = await _channel.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
      return 0;
    }
  }

  static Future<int> getBatteryTemperature() async {
    try {
      final int batteryTemperature =
      await _channel.invokeMethod('getBatteryTemperature');
      return batteryTemperature;
    } on PlatformException catch (e) {
      log('Error: ${e.message}');
      return 0;
    }
  }
}
