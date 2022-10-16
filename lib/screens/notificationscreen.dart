import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> notificationlist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: const EdgeInsets.only(left: 12, top: 10),
              child: Text("Notifications",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 20)))),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 5),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children:
                            List.generate(notificationlist.length, (index) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 245, 220),
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 255, 245, 220)),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Text(
                                      "Jumping jack",
                                      style: GoogleFonts.notoSansMono(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ));
                        }),
                      ),
                    )))));
  }
}
