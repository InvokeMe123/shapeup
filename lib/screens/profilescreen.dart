import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../services/firebaseservices.dart';
import 'package:shapeup/screens/logintoscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  width: 35,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 252, 255),
                      border: Border.all(
                          color: const Color.fromARGB(255, 227, 252, 255),
                          width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    color: const Color.fromARGB(255, 100, 100, 100),
                    iconSize: 20,
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  )),
            )
          ],
          backgroundColor: Colors.white,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // ignore: sized_box_for_whitespace
        body: SafeArea(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 25, right: 25, bottom: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromARGB(255, 7, 201, 255)),
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Image.asset(
                                "assets/splash.png",
                                fit: BoxFit.contain,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Aadarsh Ghimire",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 45,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "BMI:",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "22",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: .5,
                                        color:
                                            const Color.fromARGB(125, 0, 0, 0),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Weight:",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "72",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: .5,
                                        color:
                                            const Color.fromARGB(125, 0, 0, 0),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Height:",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "180",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: .5,
                                        color:
                                            const Color.fromARGB(125, 0, 0, 0),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 1,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              color: const Color.fromARGB(255, 227, 252, 255),
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Settings",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 14,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              color: const Color.fromARGB(255, 227, 252, 255),
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await FirebaseService().signOut();
                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration: const Duration(
                                                      milliseconds: 250),
                                                  child:
                                                      const LogIntoScreen()));
                                        },
                                        child: Text(
                                          "Sign out",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )))));
  }
}
