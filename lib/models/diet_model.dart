class DietModel {
  final String id;
  final String title;
  final String description;
  final String caution;
  final String imagePath;
  final String duration;
  final String difficulty;
  final String commitment;
  List<String>? planCondition;

  DietModel({
    required this.id,
    required this.duration,
    required this.title,
    required this.description,
    required this.caution,
    required this.imagePath,
    required this.commitment,
    required this.difficulty,
    this.planCondition,
  });
}
