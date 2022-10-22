import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          children: [
            Column(children: [
              Container(
                color: Colors.red,
                height: 250,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rest",
                      style: GoogleFonts.notoSansMono(
                          color: Colors.black.withOpacity(.80),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Rest Time",
                      style: GoogleFonts.notoSansMono(
                          color: Colors.black.withOpacity(.80),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Add +20s",
                            style: GoogleFonts.notoSansMono(
                                color: Colors.black.withOpacity(.75),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Skip",
                            style: GoogleFonts.notoSansMono(
                                color: Colors.black.withOpacity(.75),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.notoSansMono(
                            color: Colors.black.withOpacity(.80),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Burpees",
                            style: GoogleFonts.notoSansMono(
                                color: Colors.black.withOpacity(.80),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "X20",
                            style: GoogleFonts.notoSansMono(
                                color: Colors.black.withOpacity(.80),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset("assets/splash.png"),
                      ),
                    ],
                  )),
            ]),
          ],
        )));
  }
}
