//Sahaj code

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ArtDetailScreen extends StatelessWidget {
  final String title;
  final String subcontent;

  ArtDetailScreen({
    required this.title,
    required this.subcontent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/arttherapy.png', // Replace with your background image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sized Box at the top
              SizedBox(height: 47.0),

              // Row with Back Button, Title, and Menu Button
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'assets/images/arrow_button.jpg', // Replace with your back button image
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                    // Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white, // White font color
                        ),
                      ),
                    ),
                    // Menu Button
                    InkWell(
                      onTap: () {
                        // Handle menu button click
                      },
                      child: Image.asset(
                        'assets/images/menubutton.jpg', // Replace with your menu button image
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Image below the title
              Image.asset(
                'assets/images/some.jpg', // Replace with your image path
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),

              // Slide-up panel
              Flexible(
                child: SlidingUpPanel(
                  minHeight: 430, // Minimum height when closed
                  maxHeight: 400.0, // Maximum height when fully opened
                  panel: Container(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Text(
                        subcontent,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
