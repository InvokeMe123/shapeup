import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/settingScreen.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  final _heightController = TextEditingController();

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
                          child: Image.asset("assets/height.png"),
                        ),
                        Text("STEPS 4/4",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: const Color.fromARGB(255, 15, 155, 155),
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("What is your height?",
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
                                "inch",
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
                            controller: _heightController,
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
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 300),
                                  child: const SettingUpScreen(),
                                )),
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
