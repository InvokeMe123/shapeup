import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shapeup/screens/subscription_screen.dart';
import 'package:shapeup/screens/unlockedscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  double? bmi;
  String? height;
  bool? premium;
  asyncFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      premium = prefs.getBool("premium");
    });
  }

  @override
  void initState() {
    asyncFunc();
    super.initState();
  }

  List<String> imagePathList = [];
  final colorizeColors = [
    Colors.teal,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.purple,
  ];
  final colorizeTextStyle = const TextStyle(
    fontSize: 35.0,
    fontFamily: 'Horizon',
  );

  final premiumDietList = [
    'Low Carb',
    'High Protein',
  ];

  // List<String> imagePathList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: premium == false
            ? const SubscriptionPage()
            : const UnlockedScreen());
  }
}
