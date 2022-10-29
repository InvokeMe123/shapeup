class DietModel {
  final String title;
  final String description;
  final String caution;
  final String imageURL;
  final String duration;
  final String difficulty;
  final String commitment;
  final List<String> planCondition;

  DietModel({
    required this.duration,
    required this.title,
    required this.description,
    required this.caution,
    required this.imageURL,
    required this.commitment,
    required this.difficulty,
    required this.planCondition,
  });
}
