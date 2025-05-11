import 'package:flutter/material.dart';

import '../SingleScreens/HelplineNumbers.dart';
import 'PHQ-9-activity.dart';

class PHQ9TestScreen extends StatefulWidget {
  @override
  _PHQ9TestScreenState createState() => _PHQ9TestScreenState();
}

class _PHQ9TestScreenState extends State<PHQ9TestScreen> {
  List<int> _answers = List.filled(9, -1);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0D0D0D),
        scaffoldBackgroundColor: Color.fromARGB(255, 26, 13, 46),
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
                color: Colors.black,
              ),
            ),
          ),
          leadingWidth: 70,
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
              question: '1.) Little interest or pleasure in doing things',
              index: 0,
            ),
            _buildQuestion(
              question: '2.) Feeling down, depressed, or hopeless',
              index: 1,
            ),
            _buildQuestion(
              question:
                  '3.) Trouble falling or staying asleep, or sleeping too much',
              index: 2,
            ),
            _buildQuestion(
              question: '4.) Feeling tired or having little energy',
              index: 3,
            ),
            _buildQuestion(
              question: '5.) Poor appetite or overeating',
              index: 4,
            ),
            _buildQuestion(
              question:
                  '6.) Feeling bad about yourself or that you are a failure or have let yourself or your family down',
              index: 5,
            ),
            _buildQuestion(
              question:
                  '7.) Trouble concentrating on things, such as reading the newspaper or watching television',
              index: 6,
            ),
            _buildQuestion(
              question:
                  '8.) Moving or speaking so slowly that other people could have noticed. Or the opposite being so fidgety or restless that you have been moving around a lot more than usual',
              index: 7,
            ),
            _buildQuestion(
              question:
                  '9.) Thoughts that you would be better off dead, or of hurting yourself',
              index: 8,
            ),
            Padding(
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
      String depressionSeverity;
      if (totalScore >= 0 && totalScore <= 4) {
        depressionSeverity = 'Minimal depression';
      } else if (totalScore >= 5 && totalScore <= 9) {
        depressionSeverity = 'Mild depression';
      } else if (totalScore >= 10 && totalScore <= 14) {
        depressionSeverity = 'Moderate depression';
      } else if (totalScore >= 15 && totalScore <= 19) {
        depressionSeverity = 'Moderately severe depression';
      } else {
        depressionSeverity = 'Severe depression';
      }

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
                  'Based on your responses, your depression severity is categorized as:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  '"$depressionSeverity"',
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
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFF253057),
        borderRadius: BorderRadius.circular(12.0),
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
