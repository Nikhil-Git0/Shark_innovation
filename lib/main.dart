import 'package:flutter/material.dart';
import 'splash.dart'; // Import SplashScreen from splash.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shark Innovation',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(), // The first screen the user sees
    );
  }
}
  