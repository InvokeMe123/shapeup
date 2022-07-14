import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shapeup/screens/agescreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shapeup/screens/dashboardscreen.dart';
import 'package:page_transition/page_transition.dart';

class LogIntoScreen extends StatefulWidget {
  const LogIntoScreen({Key? key}) : super(key: key);

  @override
  State<LogIntoScreen> createState() => _LogIntoScreenState();
}

class _LogIntoScreenState extends State<LogIntoScreen> {
  Future<void> signInWithGoogle() async {
    final auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final authCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // ignore: avoid_print

    UserCredential result = await auth.signInWithCredential(authCredential);
    if (result.additionalUserInfo?.isNewUser == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 250),
              child: const AgeScreen()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 250),
              child: const DashBoardScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // ignore: sized_box_for_whitespace
        body: SafeArea(
          child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset("assets/loginto.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome to",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(.75),
                      ),
                    ),
                    Text(
                      "Shape Up",
                      style: GoogleFonts.montserrat(
                        letterSpacing: 2,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(1),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Make yourself stronger than your excuses.",
                      style: GoogleFonts.manjari(
                        height: .5,
                        letterSpacing: 0.5,
                        fontSize: 12,
                        color: Colors.black.withOpacity(.25),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 16,
                          color: Colors.orange,
                        ),
                        label: Text(
                          "Sign In With Google",
                          style: GoogleFonts.notoSansMono(
                              color: Colors.black.withOpacity(.75),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () async {
                          await signInWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: const Color.fromARGB(255, 255, 234, 194),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "By creating your acount, you are agreeing to our",
                      style: GoogleFonts.montserrat(
                        letterSpacing: .4,
                        fontSize: 10,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    Text(
                      "Terms and Services",
                      style: GoogleFonts.montserrat(
                        height: 1.4,
                        letterSpacing: .4,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(.75),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
