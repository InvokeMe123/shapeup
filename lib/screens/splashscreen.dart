import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shapeup/screens/agescreen.dart';
import 'package:shapeup/screens/dashboardscreen.dart';
import 'package:shapeup/screens/logintoscreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool pData = false;
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('profile')
        .doc(user?.uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              if (snapshot.exists) {pData = true}
            });

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 300),
                child: user != null
                    ? (pData == true
                        ? const DashBoardScreen()
                        : const AgeScreen())
                    : const LogIntoScreen(),
              ),
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // ignore: sized_box_for_whitespace
        body: SafeArea(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, bottom: 50),
                          child: Image.asset("assets/splash.png"),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Text("Shape Up",
                            style: GoogleFonts.lateef(
                                letterSpacing: .5,
                                color: Colors.black,
                                fontSize: 42,
                                fontWeight: FontWeight.w300)),
                      ),
                    )
                  ],
                ))));
  }
}
