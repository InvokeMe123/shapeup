// ignore_for_file: file_names, avoid_print, duplicate_ignore

import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/dashboardscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingUpScreen extends StatefulWidget {
  const SettingUpScreen({Key? key}) : super(key: key);

  @override
  State<SettingUpScreen> createState() => _SettingUpScreenState();
}

class _SettingUpScreenState extends State<SettingUpScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  int? height;
  int? weight;
  double bmi = 0;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('profile')
        .doc(user?.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        weight = int.tryParse(data['weight']);
        height = int.tryParse(data['height']);
        print(height);
        print(weight);
        bmi = (weight! / pow(height! / 100, 2));
        print(bmi);
      } else {
        print('Document does not exist on the database');
      }
      FirebaseFirestore.instance.collection('profile').doc(user?.uid).update({
        'BMI': bmi,
      }).then((value) => Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 250),
              child: const DashBoardScreen())));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        // ignore: sized_box_for_whitespace
        body: SafeArea(
            child: Center(
          child: Text("setting up the profile"),
        )));
  }
}
