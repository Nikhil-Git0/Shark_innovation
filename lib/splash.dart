import 'package:flutter/material.dart';
import 'login.dart'; // Import LoginScreen from login.dart

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  // After 3 seconds, navigate to the login screen
  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 7), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09A7A7),
      body: Center(
        child: Image.asset('assets/shark_logo.png'), // Your logo
      ),
    );
  }
}
