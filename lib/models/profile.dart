class Profile {
  Profile({
    this.userAge,
    this.userGender,
    this.userHeight,
    this.userWeight,
  });
  dynamic userAge;
  dynamic userGender;
  dynamic userHeight;
  dynamic userWeight;

  set setUserAge(String userAge) {
    userAge = userAge;
  }

  get getUserAge {
    return userAge;
  }
}
