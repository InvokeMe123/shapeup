import 'package:flutter/material.dart';
import 'package:shapeup/screens/dietscreen.dart';
import 'package:shapeup/screens/homescreen.dart';
import 'package:shapeup/screens/notificationscreen.dart';
import 'package:shapeup/screens/premiumscreen.dart';
import 'package:shapeup/screens/workoutscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

asyncFunc() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection('profile')
      .doc(user?.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      prefs.setDouble("BMI", (data['BMI']));
      prefs.setString("age", (data['age']));
      prefs.setString("gender", (data['gender']));
      prefs.setString("height", (data['height']));
      prefs.setString("weight", (data['weight']));
      prefs.setBool("premium", (data['premium']));
    }
  });
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    asyncFunc();
    super.initState();
  }

  final List<Widget> screens = [
    const HomeScreen(),
    const WorkoutScreen(),
    const DietScreen(),
    const NotificationScreen(),
    const PremiumScreen(),
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
            activeIcon: Icon(Icons.run_circle),
            icon: Icon(Icons.run_circle_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.food_bank),
            icon: Icon(Icons.food_bank_outlined),
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
