import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/workoutrunningscreen.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<int> text = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: const EdgeInsets.only(left: 12, top: 10),
              child: Text("Your Workout",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 20)))),
        ),
        body: SafeArea(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 25),
                          child: Row(
                            children: [
                              Text(
                                "DAY:",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                " 1",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "20",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  " workouts",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "20",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  " minutes",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 153, 152, 152)),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 5),
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: List.generate(text.length, (index) {
                                  return Container(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: Color.fromARGB(
                                                255, 139, 138, 138)),
                                      )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 60,
                                              width: 60,
                                              child: Image.asset(
                                                  "assets/male.png"),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Jumping jack",
                                                  style:
                                                      GoogleFonts.notoSansMono(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  text[index].toString(),
                                                  style:
                                                      GoogleFonts.notoSansMono(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ));
                                }),
                              ),
                            ))
                      ]),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        duration:
                                            const Duration(milliseconds: 250),
                                        child: const WorkoutRunningScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary:
                                      const Color.fromARGB(255, 227, 252, 255),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  textStyle: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              child: Text(
                                "Start",
                                style: GoogleFonts.notoSansMono(
                                    color: Colors.black.withOpacity(.75),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ))
                  ],
                ))));
  }
}
