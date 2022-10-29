import 'package:flutter/material.dart';
import 'package:shapeup/models/exercise_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercisemodel;
  const ExerciseCard({Key? key, required this.exercisemodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) => DietDetailPage(
      //               dietModel: exercisemodel,
      //             ))),
      child: Card(
        //low carb card
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        elevation: 10.0,
        child: Row(
          children: [
            Text(
              "DAY",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              exercisemodel.type,
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
