import 'dart:async';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/runner.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  State<RestScreen> createState() => _RestScreenState();
}

int timeLeft = 20;

class _RestScreenState extends State<RestScreen> {
  setAgain() {
    setState(() {
      timeLeft = 20;
    });
  }

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });

      if (timeLeft == 0) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 250),
                child: const ExerciseRunScreen()));
        setAgain();
      }
    });
  }

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.notoSansMono(
                              color: Colors.black.withOpacity(.80),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Burpees",
                              style: GoogleFonts.notoSansMono(
                                  color: Colors.black.withOpacity(.80),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "X20",
                              style: GoogleFonts.notoSansMono(
                                  color: Colors.black.withOpacity(.80),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 153, 152, 152)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 240,
                          width: double.infinity,
                          child: Image.asset("assets/splash.png"),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 125, 117, 6),
                    height: 250,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rest",
                          style: GoogleFonts.notoSansMono(
                              color: Colors.black.withOpacity(.80),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "00:$timeLeft",
                          style: GoogleFonts.notoSansMono(
                              color: Colors.black.withOpacity(.80),
                              fontSize: 36,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  timeLeft = timeLeft + 10;
                                });
                              },
                              child: Text(
                                "Add +10s",
                                style: GoogleFonts.notoSansMono(
                                    color: Colors.black.withOpacity(.75),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        duration:
                                            const Duration(milliseconds: 250),
                                        child: const ExerciseRunScreen()));
                                setAgain();
                              },
                              child: Text(
                                "Skip",
                                style: GoogleFonts.notoSansMono(
                                    color: Colors.black.withOpacity(.75),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
