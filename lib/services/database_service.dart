import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shapeup/models/daily_diet_model.dart';
import 'package:shapeup/models/diet_model.dart';

class DatabaseService {
  final CollectionReference dietCollection =
      FirebaseFirestore.instance.collection('Diet');

  final CollectionReference dailyPlanCollection = FirebaseFirestore.instance
      .collection('Diet')
      .doc()
      .collection('DailyPlan');

  List<DailyDietModel> _dailyDietPlan(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => DailyDietModel(
              amSnack: doc['A.M.Snack'] ?? '',
              breakfast: doc['Breakfast'] ?? '',
              dinner: doc['Dinner'] ?? '',
              lunch: doc['Lunch'] ?? '',
              pmSnack: doc['P.M.Snack'] ?? '',
            ))
        .toList();
  }

  List<String> _dietDaily(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => doc['Lunch'] as String).toList();
  }

  Stream<List<String>> get dailyDietInfo {
    return dailyPlanCollection.snapshots().map(_dietDaily);
  }

  List<DietModel> _dietListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return DietModel(
          title: doc['DietName'] ?? '',
          duration: doc['Duration'] ?? '',
          difficulty: doc['Difficulty'] ?? '',
          imageURL: doc['imageUrl'] ?? '',
          description: doc['Description'] ?? '',
          commitment: doc['Commitment'] ?? '',
          caution: doc['Caution'] ?? '',
          planCondition: []);
    }).toList();
  }

  //get dietInfo stream
  Stream<List<DietModel>> get dietInfo {
    return dietCollection.snapshots().map(_dietListFromSnapshot);
  }
}
