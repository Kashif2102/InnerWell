//Sahaj code

import 'package:flutter/material.dart';

class UpcomingAppointmentsScreen extends StatefulWidget {
  const UpcomingAppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointmentsScreen> createState() =>
      _UpcomingAppointmentsScreenState();
}

class _UpcomingAppointmentsScreenState
    extends State<UpcomingAppointmentsScreen> {
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
          backgroundColor:
              Colors.transparent, // Make scaffold background transparent
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Upcoming"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Color.fromARGB(255, 40, 40, 46),
                elevation: 4.0,
                margin: EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'images/profile.jpeg'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    'Kashif',
                    style: TextStyle(
                      color: Colors.white,
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
