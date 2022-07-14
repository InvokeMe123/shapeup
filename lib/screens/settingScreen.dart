// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/dashboardscreen.dart';

class SettingUpScreen extends StatefulWidget {
  const SettingUpScreen({Key? key}) : super(key: key);

  @override
  State<SettingUpScreen> createState() => _SettingUpScreenState();
}

class _SettingUpScreenState extends State<SettingUpScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 300),
                child: const DashBoardScreen(),
              ),
            ));

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
