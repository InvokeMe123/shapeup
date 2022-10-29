import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shapeup/models/exercise_detail_model.dart';
import 'package:shapeup/models/exercise_model.dart';

class ExerciseDatabase {
  final String? docID;
  ExerciseDatabase({this.docID});
  final CollectionReference exercisecollection =
      FirebaseFirestore.instance.collection('exercise');

  List<ExerciseModel> _exerciseTypeFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ExerciseModel(
        id: doc.id,
        type: doc['type'] ?? '',
      );
    }).toList();
  }

  //get dietInfo stream
  Stream<List<ExerciseModel>> get exerciseInfo {
    return exercisecollection.snapshots().map(_exerciseTypeFromSnapshot);
  }

  List<ExerciseDetailModel> _dayExericsePlan(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => ExerciseDetailModel(
              name: doc['name'] ?? '',
              counter: doc['counter'] ?? '',
              description: doc['description'] ?? '',
              gif: doc['gif'] ?? '',
            ))
        .toList();
  }

  Stream<List<ExerciseDetailModel>> get listExerciseInfo {
    return exercisecollection
        .doc(docID)
        .collection("day1")
        .snapshots()
        .map(_dayExericsePlan);
  }
}
