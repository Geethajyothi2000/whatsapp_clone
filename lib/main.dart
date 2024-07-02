import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/NewScreen/LandingScreen.dart';
import 'package:whatsapp_clone/Screens/CameraScreen.dart';
import 'package:whatsapp_clone/Screens/Homescreen.dart';
import 'package:whatsapp_clone/Screens/LoginScreen.dart';

List<CameraDescription> cameras = []; // Define cameras globally

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras(); // Initialize the cameras list
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xff075E54), // Dark green color for the app bar
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color.fromARGB(255, 127, 180, 173), // Secondary green color for the FAB, buttons, etc.
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xff075E54), // Same dark green color for the app bar
        ),
      ),
      home: LandingScreen(), // Use a unique key if needed
    );
  }
}
