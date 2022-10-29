import 'package:flutter/material.dart';
import 'package:shapeup/models/exercise_model.dart';
import 'package:shapeup/screens/exercisedaydetail.dart';
import 'package:styled_widget/styled_widget.dart';

class ExerciseDayListDetail extends StatelessWidget {
  final ExerciseModel exercisemodel;
  const ExerciseDayListDetail({Key? key, required this.exercisemodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(exercisemodel.type),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exercisemodel.type,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // print(exercisemodel.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExerciseDayDetail(
                          docId: exercisemodel.id,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                  ),
                  child: const Text(
                    'See Plan Details',
                    style: TextStyle(fontSize: 15),
                  ),
                ).height(45).padding(top: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
