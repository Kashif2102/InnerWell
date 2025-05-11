import 'package:flutter/material.dart';
import 'package:mental_health_app1/Screens/Test%20Screens/RedirectToExercises.dart';

class PHQ9ExerciseRecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0D0D0D), // Custom darker color
        scaffoldBackgroundColor:
            Color.fromARGB(255, 26, 13, 46), // Custom darker color
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 26, 13, 46),
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.black, // This is the icon color
              ),
            ),
          ),
          leadingWidth: 70, // Adjust the width as per your requirement
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350, // specify height
                  child: _buildCard(
                    'assets/images/activity1.jpg',
                    'Do a quick exercise (20 Jumping Jacks)',
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 350, // specify height
                  child: _buildCard(
                    'assets/images/activity2.jpg',
                    'Doodle how your day went',
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 350, // specify height
                  child: _buildCard(
                    'assets/images/activity3.jpg',
                    'Headbang to a rock song',
                  ),
                ),
                Center(
                  // Center the button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DecisionScreen()));
                    },
                    child: Text('Done'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.purple, // This is the background color
                      foregroundColor:
                          Colors.white, // This is the color of the text
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Icon(Icons.home),
        ),
      ),
    );
  }

  Widget _buildCard(String imagePath, String cardText) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          color: Colors.black.withOpacity(0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            cardText,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
