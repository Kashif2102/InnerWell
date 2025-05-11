import 'package:flutter/material.dart';
import 'package:mental_health_app1/Screens/Breathing%20Exercises%20Screens/Breathing2.dart';

class BreathingExerciseSelectionScreen extends StatelessWidget {
  // List of exercises with details
  final exercises = [
    {
      'title': 'Box Breathing (4-4-4-4)',
      'benefit': 'Reduces stress and calms the nervous system.',
      'inhale': 4,
      'hold': 4,
      'exhale': 4,
      'holdAfterExhale': 4,
    },
    {
      'title': '4-7-8 Breathing',
      'benefit': 'Promotes relaxation and helps with sleep.',
      'inhale': 4,
      'hold': 7,
      'exhale': 8,
      'holdAfterExhale': 0,
    },
    {
      'title': 'Diaphragmatic Breathing (5-5)',
      'benefit': 'Improves oxygen intake and reduces anxiety.',
      'inhale': 5,
      'hold': 0,
      'exhale': 5,
      'holdAfterExhale': 0,
    },
    {
      'title': 'Paced Breathing (5-5)',
      'benefit': 'Enhances relaxation and focus.',
      'inhale': 5,
      'hold': 0,
      'exhale': 5,
      'holdAfterExhale': 0,
    },
    {
      'title': 'Lion’s Breath',
      'benefit': 'Releases tension in the face and chest, reduces stress.',
      'inhale': 4,
      'hold': 0,
      'exhale': 6,
      'holdAfterExhale': 0,
    },
    {
      'title': 'Resonant Breathing (5-5)',
      'benefit': 'Balances the nervous system, reduces anxiety.',
      'inhale': 5,
      'hold': 0,
      'exhale': 5,
      'holdAfterExhale': 0,
    },
    {
      'title': 'Skull Shining Breath',
      'benefit': 'Energizes the mind and improves focus.',
      'inhale': 1,
      'hold': 0,
      'exhale': 1,
      'holdAfterExhale': 0,
    },
    {
      'title': 'Equal Breathing (4-4)',
      'benefit': 'Balances the body and reduces stress.',
      'inhale': 4,
      'hold': 0,
      'exhale': 4,
      'holdAfterExhale': 0,
    },
    {
      'title': 'Alternate Nostril Breathing',
      'benefit': 'Balances energy and improves focus.',
      'inhale': 4,
      'hold': 4,
      'exhale': 4,
      'holdAfterExhale': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Breathing Exercise'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return _buildExerciseCard(
            context,
            exercise['title'] as String,
            exercise['benefit'] as String,
            exercise['inhale'] as int,
            exercise['hold'] as int,
            exercise['exhale'] as int,
            exercise['holdAfterExhale'] as int,
          );
        },
      ),
    );
  }

  Widget _buildExerciseCard(
    BuildContext context,
    String title,
    String benefit,
    int inhale,
    int hold,
    int exhale,
    int holdAfterExhale,
  ) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exercise Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.tealAccent,
              ),
            ),
            SizedBox(height: 8),
            // Exercise Benefit
            Text(
              benefit,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 16),
            // Navigate Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BreathingExerciseScreen(
                        exerciseName: title,
                        inhaleSeconds: inhale,
                        holdSeconds: hold,
                        exhaleSeconds: exhale,
                        holdAfterExhaleSeconds: holdAfterExhale,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Start Exercise',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
