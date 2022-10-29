import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shapeup/models/exercise_model.dart';

class ExerciseDatabase {
  final CollectionReference exercisecollection =
      FirebaseFirestore.instance.collection('exercise');

  final DocumentReference exercisedocs =
      FirebaseFirestore.instance.collection('exercise').doc('weightloss');

  List<ExerciseModel> _exerciseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ExerciseModel(
        type: doc['weightloss'] ?? '',
      );
    }).toList();
  }

  //get dietInfo stream
  Stream<List<ExerciseModel>> get exerciseInfo {
    return exercisecollection.snapshots().map(_exerciseListFromSnapshot);
  }
}
