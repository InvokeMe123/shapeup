import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class PremiumScreem extends StatefulWidget {
  const PremiumScreem({Key? key}) : super(key: key);

  @override
  State<PremiumScreem> createState() => _PremiumScreemState();
}

class _PremiumScreemState extends State<PremiumScreem> {
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
              child: Text("Premium",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 20)))),
        ),
        body: SafeArea(
            child: Padding(
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
                        "Burn atleast 400",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Burn atleast 400",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
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
          ]),
        )));
  }
}
