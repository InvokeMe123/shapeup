import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shapeup/components/gendercard.dart';
import 'package:shapeup/screens/weightscreen.dart';
import 'package:page_transition/page_transition.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

enum Gender {
  male,
  female,
}

class _GenderScreenState extends State<GenderScreen> {
  late Gender selectedGender = Gender.male;
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
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("STEPS 2/4",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: const Color.fromARGB(255, 15, 155, 155),
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Which one are you?",
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = Gender.male;
                                  });
                                },
                                child: GenderCard(
                                    cardBorder:
                                        selectedGender == Gender.male ? 2 : 0,
                                    cardChild: Image.asset("assets/male.png")),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = Gender.female;
                                  });
                                },
                                child: GenderCard(
                                    cardBorder:
                                        selectedGender == Gender.female ? 2 : 0,
                                    cardChild:
                                        Image.asset("assets/female.png")),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                            "To give you customize experience we need to know your gender.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                letterSpacing: .5,
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 75,
                        ),
                        SizedBox(
                          width: 180,
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: const Duration(milliseconds: 250),
                                    child: const WeightScreen(),
                                  )),
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
