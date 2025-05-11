import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mental_health_app1/Screens/MainScreen.dart';
import './quotes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // List of mental health quotes

  String randomQuote = '';
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Select a random quote from the list
    final random = Random();
    randomQuote = quotes[random.nextInt(quotes.length)];

    // Start fade-in animation
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Trigger the fade-in
      });
    });

    // Start a timer to navigate to the next screen after 5 seconds with a fade transition
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              Duration(seconds: 2), // Adjust duration for smoothness
          pageBuilder: (context, animation, secondaryAnimation) => MainScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for splash screen
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2), // Fade in duration
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon
              Image.asset(
                'assets/icons/icon.png', // Add your app icon here
                height: 400, // Adjust icon size
                width: 400,
              ),
              SizedBox(height: 30), // Space between icon and quote
              // Random Mental Health Quote
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  randomQuote,
                  style: TextStyle(
                    color: Colors.white, // White text on dark background
                    fontSize: 18.0, // Font size for quote
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
