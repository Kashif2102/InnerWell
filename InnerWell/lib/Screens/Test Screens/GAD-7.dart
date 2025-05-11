import 'package:flutter/material.dart';

import '../SingleScreens/HelplineNumbers.dart';
import 'PHQ-9-activity.dart';

class GAD7TestScreen extends StatefulWidget {
  @override
  _GAD7TestScreenState createState() => _GAD7TestScreenState();
}

class _GAD7TestScreenState extends State<GAD7TestScreen> {
  List<int> _answers = List.filled(7, -1);

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
                  borderRadius: BorderRadius.circular(15.0)),
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
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'Over the last 2 weeks, how often have you been bothered by any of the following problems?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildQuestion(
              question: '1.)Feeling nervous, anxious, or on edge',
              index: 0,
            ),
            _buildQuestion(
              question: '2.) Not being able to stop or control worrying',
              index: 1,
            ),
            _buildQuestion(
              question: '3.) Worrying too much about different things',
              index: 2,
            ),
            _buildQuestion(
              question: '4.) Trouble relaxing',
              index: 3,
            ),
            _buildQuestion(
              question: '5.) Being so restless that it is hard to sit still',
              index: 4,
            ),
            _buildQuestion(
              question: '6.) Becoming easily annoyed or irritable',
              index: 5,
            ),
            _buildQuestion(
              question:
                  '7.) Trouble concentrating on things, such as reading the newspaper or watching television',
              index: 6,
            ),
            Padding(
              // Adding a Padding widget to give some space above the button
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _calculateScore,
                child: Text('Calculate Score'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateScore() {
    if (_answers.contains(-1)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Please answer all the questions before calculating the score.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      int totalScore =
          _answers.fold(0, (previous, current) => previous + current);
      String AnxietySeverity;
      if (totalScore >= 0 && totalScore <= 4) {
        AnxietySeverity = 'Minimal Anxiety';
      } else if (totalScore >= 5 && totalScore <= 9) {
        AnxietySeverity = 'Mild Anxiety';
      } else if (totalScore >= 10 && totalScore <= 14) {
        AnxietySeverity = 'Moderate Anxiety';
      } else if (totalScore >= 15 && totalScore <= 19) {
        AnxietySeverity = 'Moderately severe Anxiety';
      } else {
        AnxietySeverity = 'Severe Anxiety';
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Your Score'),
            content: Text(
                'Your total score is: $totalScore\nAnxiety severity: $AnxietySeverity'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (totalScore < 15) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PHQ9ExerciseRecommendationScreen()));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HelplineScreen()));
                  }
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (context) {
          Color severityColor;
          if (totalScore >= 0 && totalScore <= 4) {
            severityColor = Colors.green;
          } else if (totalScore >= 5 && totalScore <= 9) {
            severityColor = Colors.blue;
          } else if (totalScore >= 10 && totalScore <= 14) {
            severityColor = Colors.yellow;
          } else if (totalScore >= 15 && totalScore <= 19) {
            severityColor = Colors.orange;
          } else {
            severityColor = Colors.red;
          }

          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFF253057),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your Score',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Thank you for taking the time to complete this assessment.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Your total score is: $totalScore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Based on your responses, your Anxiety severity is categorized as:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  '"$AnxietySeverity"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: severityColor, // Applying the determined color here
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'It is important to note that this test is not a definitive diagnosis. It is always a good idea to consult with a healthcare provider or a mental health professional if you have concerns about your mental health.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff110320), // button color
                    foregroundColor: Colors.white, // text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // radius of button
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (totalScore < 15) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PHQ9ExerciseRecommendationScreen()));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HelplineScreen()));
                    }
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Widget _buildQuestion({required String question, required int index}) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: 16.0), // Add margin to separate each MCQ block
      padding: const EdgeInsets.all(
          8.0), // Add padding to give some space around the contents
      decoration: BoxDecoration(
        color: Color(
            0xFF253057), // Set the background color of the entire MCQ block
        borderRadius:
            BorderRadius.circular(12.0), // Optional: to have rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: TextStyle(fontSize: 18.0)),
          ...List.generate(4, (i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _answers[index] = i;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: _answers[index] == i
                      ? const Color(0xff110320)
                      : Color.fromARGB(248, 198, 106, 255),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  _textForAnswerIndex(i),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _answers[index] == i ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  String _textForAnswerIndex(int index) {
    switch (index) {
      case 0:
        return 'A. Not at all';
      case 1:
        return 'B. Several days';
      case 2:
        return 'C. More than half the days';
      case 3:
        return 'D. Nearly every day';
      default:
        return '';
    }
  }
}
