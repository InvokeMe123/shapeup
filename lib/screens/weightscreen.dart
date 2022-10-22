import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/heightscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, bottom: 60),
                          child: Image.asset("assets/weight.png"),
                        ),
                        Text("STEPS 3/4",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: const Color.fromARGB(255, 15, 155, 155),
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("What is your weight?",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 15, 155, 155)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10, top: 10),
                              child: Text(
                                "KG",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    letterSpacing: .5,
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 75,
                          child: TextField(
                            controller: _weightController,
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
                                  .update({
                                'weight': _weightController.text,
                              }).then((value) => Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 250),
                                          child: const HeightScreen())))
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
