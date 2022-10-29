import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shapeup/models/daily_diet_model.dart';
import 'package:shapeup/models/diet_model.dart';

class DatabaseService {
  final String? docID;
  DatabaseService({this.docID});

  final CollectionReference dietCollection =
      FirebaseFirestore.instance.collection('Diet');

  List<DailyDietModel> _dailyDietPlan(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => DailyDietModel(
              amSnack: '',
              breakfast: doc['Breakfast'] ?? '',
              dinner: doc['Dinner'] ?? '',
              lunch: doc['Lunch'] ?? '',
              pmSnack: '',
            ))
        .toList();
  }

  Stream<List<DailyDietModel>> get dailyDietInfo {
    return dietCollection
        .doc(docID)
        .collection('DietLowCarb101')
        .snapshots()
        .map(_dailyDietPlan);
  }

  List<DietModel> _dietListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return DietModel(
        id: doc.id,
        title: doc['DietName'] ?? '',
        duration: doc['Duration'] ?? '',
        difficulty: doc['Difficulty'] ?? '',
        imagePath: doc['imageUrl'] ?? '',
        description: doc['Description'] ?? '',
        commitment: doc['Commitment'] ?? '',
        caution: doc['Caution'] ?? '',
      );
    }).toList();
  }

  //get dietInfo stream
  Stream<List<DietModel>> get dietInfo {
    return dietCollection.snapshots().map(_dietListFromSnapshot);
  }
}
