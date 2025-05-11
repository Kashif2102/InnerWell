//Sahaj code

import 'package:flutter/material.dart';
import 'package:mental_health_app1/Screens/YourTherapistScreens/Select_DocScreen.dart';
import 'package:mental_health_app1/Screens/YourTherapistScreens/UpcomingScreens.dart';
import 'package:mental_health_app1/Screens/YourTherapistScreens/previousScreen.dart';

class TherapistScreen extends StatefulWidget {
  @override
  _TherapistScreenState createState() => _TherapistScreenState();
}

class _TherapistScreenState extends State<TherapistScreen> {
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Your Therapist"),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/therapist.jpg', // Replace with your background image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: screenHeight * 1, // Use screenHeight
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: 3.0,
                      mainAxisSpacing: 16.0, // Add spacing between cards
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectDoctorScreen(),
                            ));
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                            child: Card(
                              color: Color.fromARGB(255, 23, 23,
                                  26), // Add a black shade to the card
                              elevation: 5.0,
                              child: Center(
                                child: Text(
                                  'Book Appointment',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UpcomingAppointmentsScreen()));
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                            child: Card(
                              color: Color.fromARGB(255, 23, 23, 26) //FF17171A

                              ,
                              elevation: 5.0,
                              child: Center(
                                child: Text(
                                  'Upcoming Appointments',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PreviousAppointmentsScreen()));
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                            child: Card(
                              color: Color.fromARGB(255, 23, 23,
                                  26), // Add a black shade to the card
                              elevation: 5.0,
                              child: Center(
                                child: Text(
                                  'Previous Appointments',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
