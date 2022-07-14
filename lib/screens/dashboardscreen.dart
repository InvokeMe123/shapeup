import 'package:flutter/material.dart';
import 'package:shapeup/screens/dietscreen.dart';
import 'package:shapeup/screens/homescreen.dart';
import 'package:shapeup/screens/notificationscreen.dart';
import 'package:shapeup/screens/premiumscreen.dart';
import 'package:shapeup/screens/workoutscreen.dart';
// import 'package:shapeup/screens/profilescreen.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const DietScreen(),
    const WorkoutScreen(),
    const NotificationScreen(),
    const PremiumScreem(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(250, 255, 255, 255),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 3,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.food_bank),
            icon: Icon(Icons.food_bank_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.run_circle),
            icon: Icon(Icons.run_circle_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.monetization_on),
            icon: Icon(Icons.monetization_on_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
    );
  }
}
