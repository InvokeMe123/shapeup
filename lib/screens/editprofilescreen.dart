import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shapeup/screens/settingScreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  final _newAgeController = TextEditingController();
  final _newHeightController = TextEditingController();
  final _newWeightController = TextEditingController();

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
                          child: Text("Edit Your Data,",
                              style: GoogleFonts.montserrat(
                                  letterSpacing: .5,
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Text("Age:",
                                style: GoogleFonts.montserrat(
                                    letterSpacing: .5,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: _newAgeController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    labelText: 'age',
                                    focusColor: Colors.black,
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Height:",
                                style: GoogleFonts.montserrat(
                                    letterSpacing: .5,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: _newHeightController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    labelText: 'Height',
                                    focusColor: Colors.black,
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Weight:",
                                style: GoogleFonts.montserrat(
                                    letterSpacing: .5,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: _newWeightController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    labelText: 'Weight',
                                    focusColor: Colors.black,
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          width: 180,
                          child: ElevatedButton(
                            onPressed: () async => {
                              // ignore: avoid_print
                              print(_newAgeController.text),
                              await FirebaseFirestore.instance
                                  .collection('profile')
                                  .doc(user?.uid)
                                  .update({
                                'age': _newAgeController.text,
                                'height': _newHeightController.text,
                                'weight': _newWeightController.text,
                              }).then((value) => Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 250),
                                          child: const SettingUpScreen())))
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
