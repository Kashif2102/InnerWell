import 'package:flutter/material.dart';
import 'package:mental_health_app1/Screens/Breathing%20Exercises%20Screens/Breathing1.dart';
import 'package:mental_health_app1/Screens/SingleScreens/KnowYourMedicine.dart';
import 'package:mental_health_app1/Screens/SingleScreens/MentalHealthNewsScreen.dart';
import 'package:mental_health_app1/Screens/SupportGroupScreens/ComSupScreen.dart';
import 'package:mental_health_app1/Screens/SingleScreens/Exercises.dart';
import 'package:mental_health_app1/Screens/ArtTherapyScreens/ArtTherapy.dart';
import 'package:mental_health_app1/Screens/SingleScreens/HelplineNumbers.dart';
import 'package:mental_health_app1/Screens/Test%20Screens/QuestSelectScreen.dart';
import 'package:mental_health_app1/Screens/YourTherapistScreens/TherapistMainScreen.dart';
import 'package:mental_health_app1/Screens/JournalScreens/journalScreen.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatelessWidget {
  //
  // Function for calendar
  void _showCalendarPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.red[300]),
              holidayTextStyle: TextStyle(color: Colors.blue[300]),
              selectedTextStyle: TextStyle(color: Colors.yellow),
              selectedDecoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              outsideTextStyle: TextStyle(color: Colors.grey[500]),
              outsideDecoration: BoxDecoration(
                color: Colors.black54,
              ),
              defaultDecoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              weekdayStyle: TextStyle(color: Colors.white),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the main background to black
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            expandedHeight:
                180.0, // Increase the expanded height for bigger logo
            floating: false,
            pinned: true,
            backgroundColor: Colors.black, // Solid black background
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  background: Container(
                    color: Colors
                        .black, // Maintain dark background for the whole app bar
                  ),
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(
                      left: 16.0,
                      bottom: 16.0,
                      top: top > 100
                          ? 0.0
                          : 43.0), // Add padding when scrolled up
                  title: Row(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        'assets/icons/icon2.png', // Replace with your PNG logo
                        height: 50.0, // Adjust the height for a bigger logo
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                );
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.calendar_today),
                color: Colors.white, // White icons for dark mode
                onPressed: () {
                  _showCalendarPopup(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.tune),
                color: Colors.white, // White icons for dark mode
                onPressed: () {
                  // TODO: Handle settings button press
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    children: [
                      _buildGridBox(
                        context,
                        'Shared Journal',
                        Icons.volunteer_activism,
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => JournalScreen()));
                        },
                      ),
                      _buildGridBox(
                        context,
                        'Latest News',
                        Icons.newspaper,
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewsScreen()));
                        },
                      ),
                      _buildGridBox(
                        context,
                        'Take a Test!',
                        Icons.question_answer_outlined,
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MentalHealthTestsScreen()));
                        },
                      ),
                      _buildGridBox(
                        context,
                        'Know Your Medicine',
                        Icons.medical_services,
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => KnowYourMedicineScreen()));
                        },
                      ),
                      // _buildGridBox(
                      //   context,
                      //   'Support Group',
                      //   Icons.group,
                      //   () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => CommunitySupportScreen(),
                      //     ));
                      //   },
                      // ),
                      _buildGridBox(
                        context,
                        'Breathing Exercises',
                        Icons.self_improvement,
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BreathingExerciseSelectionScreen()));
                        },
                      ),
                      // _buildGridBox(
                      //   context,
                      //   'Art Therapy',
                      //   Icons.palette,
                      //   () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => ArtTherapyScreen()));
                      //   },
                      // ),
                      // _buildGridBox(
                      //   context,
                      //   'Your Therapist',
                      //   Icons.person,
                      //   () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => TherapistScreen()));
                      //   },
                      // ),
                      _buildGridBox(
                        context,
                        'Helpline Numbers',
                        Icons.call,
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HelplineScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridBox(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey[850], // Dark grey for grid boxes
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.white, // White icon for dark mode
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.white, // White text for better contrast
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
