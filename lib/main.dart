import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:push_temp/features/battery_information/screens/battery_screen.dart';

//-------------------------------------------------------------------------//

void main() {
  runApp(const MyApp());
}

//-------------------------------------------------------------------------//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.blue, // Change the color to your desired color
    // ));

    return const MaterialApp(
      // theme: ThemeData(
      //   brightness: Brightness.light, // Light mode
      //   // Define other theme properties as needed
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark, // Dark mode
      //   // Define other dark mode theme properties as needed
      // ),
      debugShowCheckedModeBanner: false,
      home: BatteryScreen(),
    );
  }
}
