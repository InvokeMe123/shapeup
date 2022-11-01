import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shapeup/screens/profilescreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/stepstracker.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String authName = '';
  String? firstName;
  String? lastName;
  String? burn = '';
  String? calories = '';
  String? glasses = '';
  DateTime date = DateTime.now();
  String? week;
  String? day;
  String? month;
  String? sleeptime = '';

  asyncFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      authName = prefs.getString("authName")!;

      int firstSpace = authName.indexOf(" ");
      firstName = authName.substring(0, firstSpace);
      sleeptime = prefs.getString("sleeptime");
      calories = prefs.getString("calories");
      glasses = prefs.getString("glasses");
      burn = prefs.getString("burn");
    });
  }

  setSleeptTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context, //context of current state
    );
    if (pickedTime != null) {
      DateTime parsedTime = DateFormat.jm()
          // ignore: use_build_context_synchronously
          .parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.

      String formattedTime = DateFormat('h:mma').format(parsedTime);
      debugPrint(formattedTime);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("sleeptime", formattedTime);

      setState(() {
        sleeptime = prefs.getString("sleeptime");
        User? user = FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance.collection('profile').doc(user?.uid).update({
          'sleeptime': sleeptime,
        });
      });
      //DateFormat() is from intl package, you can format the time on any pattern you need.
    } else {
      debugPrint("Time is not selected");
    }
  }

  @override
  void initState() {
    setState(() {
      asyncFunc();

      week = DateFormat('EEEE').format(date);
      day = DateFormat('d').format(date);
      month = DateFormat('MMMM').format(date);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 163, 246, 255),
                              width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        color: const Color.fromARGB(255, 100, 100, 100),
                        iconSize: 24,
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(Icons.person_outlined),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 300),
                              child: const ProfileScreen(),
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hey, $firstName",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("$week, $day $month",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Lifestyle",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        letterSpacing: .5,
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    color: const Color.fromARGB(255, 255, 245, 220),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nutrition",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.manjari(
                                  letterSpacing: .5,
                                  color: const Color.fromARGB(150, 0, 0, 0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 3,
                                          color: const Color.fromARGB(
                                              255, 228, 228, 228))),
                                  child: const Center(
                                      child: Icon(
                                    size: 28,
                                    Icons.food_bank_outlined,
                                    color: Colors.amber,
                                  )),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Eat upto $calories cal",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      letterSpacing: .5,
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        color: const Color.fromARGB(255, 227, 252, 255),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 3,
                                          color: const Color.fromARGB(
                                              255, 228, 228, 228))),
                                  child: const Center(
                                      child: Icon(
                                    size: 28,
                                    Icons.run_circle_outlined,
                                    color: Colors.amber,
                                  )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Burn atleast $burn",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "calories",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      letterSpacing: .5,
                                      color: const Color.fromARGB(125, 0, 0, 0),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        color: const Color.fromARGB(255, 227, 252, 255),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 3,
                                          color: const Color.fromARGB(
                                              255, 228, 228, 228))),
                                  child: const Center(
                                      child: Icon(
                                    size: 28,
                                    Icons.water_drop_sharp,
                                    color: Colors.amber,
                                  )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Drink $glasses glasses",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "of water",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: const Color.fromARGB(125, 0, 0, 0),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      color: const Color.fromARGB(255, 240, 240, 240),
                      child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sleep Time : $sleeptime",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 20,
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    setSleeptTime();
                                  },
                                ),
                              ],
                            ),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      color: const Color.fromARGB(255, 240, 240, 240),
                      child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "View all trackers",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.all(0),
                                  color: Colors.black,
                                  iconSize: 24,
                                  icon: const Icon(Icons.arrow_right_alt),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: const StepTracker(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
