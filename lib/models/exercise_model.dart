class ExerciseModel {
  String type;

  ExerciseModel({
    required this.type,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      type: json['type'],
    );
  }
}
