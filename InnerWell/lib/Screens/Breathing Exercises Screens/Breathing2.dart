import 'dart:async';
import 'package:flutter/material.dart';

class BreathingExerciseScreen extends StatefulWidget {
  final String exerciseName;
  final int inhaleSeconds;
  final int holdSeconds;
  final int exhaleSeconds;
  final int holdAfterExhaleSeconds;

  BreathingExerciseScreen({
    required this.exerciseName,
    required this.inhaleSeconds,
    required this.holdSeconds,
    required this.exhaleSeconds,
    required this.holdAfterExhaleSeconds,
  });

  @override
  _BreathingExerciseScreenState createState() =>
      _BreathingExerciseScreenState();
}

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with SingleTickerProviderStateMixin {
  String currentPhase = "Inhale";
  bool isBreathing = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds:
            widget.inhaleSeconds + widget.holdSeconds + widget.exhaleSeconds,
      ),
    )..addListener(() {
        updatePhase();
      });
  }

  void startBreathingExercise() {
    setState(() {
      isBreathing = true;
      currentPhase = "Inhale";
    });
    _animationController.repeat(); // Repeats the animation infinitely
  }

  void updatePhase() {
    double inhaleProgress = widget.inhaleSeconds /
        (widget.inhaleSeconds + widget.holdSeconds + widget.exhaleSeconds);
    double holdProgress = (widget.inhaleSeconds + widget.holdSeconds) /
        (widget.inhaleSeconds + widget.holdSeconds + widget.exhaleSeconds);

    setState(() {
      if (_animationController.value < inhaleProgress) {
        currentPhase = "Inhale";
      } else if (_animationController.value < holdProgress) {
        currentPhase = "Hold";
      } else {
        currentPhase = "Exhale";
      }
    });
  }

  void stopBreathingExercise() {
    _animationController.stop();
    setState(() {
      isBreathing = false;
      currentPhase = "Inhale";
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        title: Text(widget.exerciseName),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display current phase
                  Text(
                    currentPhase,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Circle Animation
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      double inhaleProgress = widget.inhaleSeconds /
                          (widget.inhaleSeconds +
                              widget.holdSeconds +
                              widget.exhaleSeconds);
                      double holdProgress =
                          (widget.inhaleSeconds + widget.holdSeconds) /
                              (widget.inhaleSeconds +
                                  widget.holdSeconds +
                                  widget.exhaleSeconds);

                      double scale;
                      if (_animationController.value < inhaleProgress) {
                        // Inhale phase (scale up)
                        scale = 0.5 +
                            (_animationController.value / inhaleProgress) * 0.5;
                      } else if (_animationController.value < holdProgress) {
                        // Hold phase (maintain scale)
                        scale = 1.0;
                      } else {
                        // Exhale phase (scale down)
                        scale = 1.0 -
                            ((_animationController.value - holdProgress) /
                                    (1.0 - holdProgress)) *
                                0.5;
                      }

                      return Transform.scale(
                        scale: scale,
                        child: Container(
                          width: 250, // Increased width for larger circle
                          height: 250, // Increased height for larger circle
                          decoration: BoxDecoration(
                            color: Colors.tealAccent.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Button to start or stop breathing exercise
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity, // Full-width button
                  child: ElevatedButton(
                    onPressed: isBreathing
                        ? stopBreathingExercise
                        : startBreathingExercise,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 15), // Adjusted for full-width
                      backgroundColor:
                          isBreathing ? Colors.red : Colors.tealAccent,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Slightly rounded corners
                      ),
                    ),
                    child: Text(
                      isBreathing ? 'Stop' : 'Start Breathing',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
