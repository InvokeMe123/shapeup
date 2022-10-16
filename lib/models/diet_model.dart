class DietModel {
  final String title;
  final String description;
  final String caution;
  final String imagePath;
  final String duration;
  final DietDifficulty difficulty;
  final String commitment;
  final List<String> planCondition;

  DietModel({
    required this.duration,
    required this.title,
    required this.description,
    required this.caution,
    required this.imagePath,
    required this.commitment,
    required this.difficulty,
    required this.planCondition,
  });
}

enum DietDifficulty {
  beginner,
  intermediate,
  advanced,
}
