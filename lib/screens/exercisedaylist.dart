import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:shapeup/models/exercise_model.dart';
import 'package:shapeup/services/exercisedb.dart';

import '../components/exercise_card.dart';

class ExerciseDayList extends StatefulWidget {
  const ExerciseDayList({Key? key}) : super(key: key);

  @override
  State<ExerciseDayList> createState() => _ExerciseDayListState();
}

class _ExerciseDayListState extends State<ExerciseDayList> {
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
            child: Text("Your Workout",
                style: GoogleFonts.montserrat(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20)))),
      ),
      body: StreamBuilder<List<ExerciseModel>>(
        stream: ExerciseDatabase().exerciseInfo,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ExerciseCard(exercisemodel: snapshot.data![index]);
                });
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}



// StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('exercise')
//                     .doc("weightloss")
//                     .collection("day1")
//                     .snapshots(),
//                 builder: (context, AsyncSnapshot snapshot) {
//                   return snapshot.hasData
//                       ? ListView.builder(
//                           itemCount: snapshot.data.docs.length,
//                           itemBuilder: (context, index) {
//                             return Text("data");
//                           },
//                         )
//                       : CircularProgressIndicator();
//                 })));