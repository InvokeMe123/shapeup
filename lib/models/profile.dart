class Profile {
  String age;
  String gender;
  String height;
  String weight;

  Profile(
    this.age,
    this.gender,
    this.height,
    this.weight,
  );

  Map<String, dynamic> toJson() => {
        'age': age,
        'gender': gender,
        'height': height,
        'userWeight': weight,
      };
}
