import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:blur/blur.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/diet_card.dart';
import '../models/diet_model.dart';
import '../services/database_service.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({Key? key}) : super(key: key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  bool? premium;
  Future asyncFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      premium = prefs.getBool("premium");
    });
  }

  @override
  void initState() {
    super.initState();
    asyncFunc();
  }

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
        child: premium == false
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
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Unlock from Premium Tab',
                            style: TextStyle(color: Colors.white),
                          ),
                        ));
                        // PageTransition(
                        //     type: PageTransitionType.fade,
                        //     duration: const Duration(milliseconds: 250),
                        //     child: const PremiumScreen());
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
            : StreamBuilder<List<DietModel>>(
                stream: DatabaseService().dietInfo,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return DietCard(dietModel: snapshot.data![index]);
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
              ),
      ),
    );
  }
}
