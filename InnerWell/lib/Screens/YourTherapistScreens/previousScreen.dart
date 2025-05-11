//Sahaj Code

import 'package:flutter/material.dart';

class PreviousAppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.asset(
          'assets/images/therapist.jpg', // Replace with your background image path
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        // Content
        Scaffold(
          appBar: AppBar(
            title: Text("Previous"),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Card(
                color: Color.fromARGB(255, 23, 23, 26),
                elevation: 4.0,
                margin: EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/therapist.jpg'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    'Sahaj',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  subtitle: Text(
                    'Chennai, India',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
