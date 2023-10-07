import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:push_temp/features/battery_information/data/battery_service.dart';
import 'package:push_temp/features/battery_information/widgets/semi_circle_progress_bar.dart';
import 'dart:async';

//-------------------------------------------------------------------------//

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  // int _batteryLevel = 0;
  int _batteryTemperature = 0;
  double mappedTemp = 0.0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    getBatteryInfo();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getBatteryInfo();
    });
  }

  Future<void> getBatteryInfo() async {
    try {
      // final batteryLevel = await BatteryService.getBatteryLevel();
      final batteryTemperature = await BatteryService.getBatteryTemperature();
      setState(() {
        // _batteryLevel = batteryLevel;
        _batteryTemperature = batteryTemperature;
        mappedTemp =
            ((_batteryTemperature - 0.0) / (60.0 - 0.0)) * (1.0 - 0.0) + 0.0;
      });
    } catch (e) {
      // Handle errors gracefully, e.g., log the error or show an error message.
      log('Error fetching battery info: $e');
    }
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Battery Info'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250.0,
              height: 100.0,
              child: CustomPaint(
                painter: SemicircleProgressPainter(mappedTemp,
                    _batteryTemperature), // Set progress value (0.0 to 1.0)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
