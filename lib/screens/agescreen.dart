import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/genderscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  final _ageController = TextEditingController();

  var authName = '';
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (final providerProfile in user.providerData) {
        final name = providerProfile.displayName;
        setState(() {
          authName = name!;
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // ignore: sized_box_for_whitespace
        body: SafeArea(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text("Welcome,",
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: .5,
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(authName,
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: .5,
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "To create a suitable fitness plan we need to know more about you.",
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: .5,
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text("STEPS 1/4",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: const Color.fromARGB(255, 15, 155, 155),
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("What is your age?",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 75,
                          child: TextField(
                            controller: _ageController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: 'Password',
                                focusColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          width: 180,
                          child: ElevatedButton(
                            onPressed: () async => {
                              await FirebaseFirestore.instance
                                  .collection('profile')
                                  .doc(user?.uid)
                                  .set({
                                'age': _ageController.text,
                              }).then((value) => Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 250),
                                          child: const GenderScreen())))
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary:
                                    const Color.fromARGB(255, 15, 155, 155),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                textStyle: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            child: Text(
                              "Next",
                              style: GoogleFonts.notoSansMono(
                                  color: Colors.black.withOpacity(.75),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
