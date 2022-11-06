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
  String? authName;
  String? notificationMessage;
  int? height;
  int? weight;
  int? age;
  String? name;
  String? email;
  String? profilePhoto;
  String? uid;

  int calorie = 0;
  int burn = 0;
  double bmr = 0;
  double amr = 0;

  int glasses = 0;
  double water = 0;

  double bmi = 0;

  String? gender;

  @override
  void initState() {
    notificationMessage = "Your premium is not activated";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (final providerProfile in user.providerData) {
        name = providerProfile.displayName;
        email = providerProfile.email;
        profilePhoto = providerProfile.photoURL;
        uid = providerProfile.uid;
      }
    }
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
        age = int.tryParse(data['age']);
        gender = data['gender'];

// calorie counter
        if (gender == "male") {
          bmr = 66.47 + (13.75 * weight!) + (5.003 * height!) - (6.755 * age!);
        } else if (gender == "female") {
          bmr = 655.1 + (13.75 * weight!) + (5.003 * height!) - (6.755 * age!);
        }
        amr = bmr * 1.375;
        int factor = amr ~/ 100;
        calorie = factor * 100;
        print(calorie);

//burn calores
        burn = (.2 * calorie).toInt();
        print(burn);

// bmi
        bmi = (weight! / pow(height! / 100, 2));
        print(bmi);

//glasses of water
        water = (weight! * 2.20462) / 2;
        glasses = water ~/ 10;
        print(water);
      } else {
        print('Document does not exist on the database');
      }

      FirebaseFirestore.instance
          .collection('notifications')
          .doc(user?.uid)
          .collection("list")
          .doc()
          .set({
        'message': notificationMessage,
      });

      FirebaseFirestore.instance.collection('profile').doc(user?.uid).update({
        "uid": uid,
        'name': name,
        'email': email,
        'profilePhoto': profilePhoto,
        'burn': burn.toString(),
        'calories': calorie.toString(),
        'glasses': glasses.toString(),
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
        body: SafeArea(child: Center(child: CircularProgressIndicator())));
  }
}
