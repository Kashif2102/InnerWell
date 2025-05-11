import 'package:flutter/material.dart';
import 'package:mental_health_app1/Screens/SupportGroupScreens/ComSupmessagesScreen.dart';
import 'package:mental_health_app1/Screens/SupportGroupScreens/ComSupwriteScreen.dart';

class CommunitySupportScreen extends StatefulWidget {
  @override
  _CommunitySupportScreenState createState() => _CommunitySupportScreenState();
}

class _CommunitySupportScreenState extends State<CommunitySupportScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0D0D0D), // Custom darker color
        scaffoldBackgroundColor: Color(0xFF0D0D0D), // Custom darker color
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(
              0xFF0D0D0D), // Custom darker color for bottom navigation bar
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF0D0D0D),
          title: Text("Support Group"),
        ),
        body: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              HomeScreen(),
              MessageScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.house_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_square),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          showSelectedLabels: false, // Set to false to hide labels
          showUnselectedLabels: false, // Set to false to hide labels
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
