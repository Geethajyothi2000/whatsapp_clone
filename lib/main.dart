import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/Screens/Homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: Homescreen(),
    );
  }
}
