import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:blur/blur.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shapeup/screens/premiumscreen.dart';

enum DietState {
  paid,
  unpaid,
}

class DietScreen extends StatefulWidget {
  const DietScreen({Key? key}) : super(key: key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  DietState currentState = DietState.unpaid;

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
              child: Text("Your Diet",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 20)))),
        ),
        body: SafeArea(
            child: currentState == DietState.unpaid
                ? SizedBox(
                    child: Image.asset(
                      'assets/dietpremium.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ).blurred(
                      colorOpacity: 0.75,
                      blur: 2,
                      overlay: ElevatedButton(
                          onPressed: () async {
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: const Duration(milliseconds: 250),
                                child: const PremiumScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: const Color.fromARGB(255, 135, 245, 255),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              textStyle: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15, right: 15, bottom: 5),
                            child: Text(
                              "Unlock Premium",
                              style: GoogleFonts.notoSansMono(
                                  color: Colors.black.withOpacity(.75),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(children: [
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Burn atleast 400 calories",
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
                    ]),
                  )));
  }
}
