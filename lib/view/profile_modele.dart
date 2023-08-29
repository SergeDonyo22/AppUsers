class UserProfile {
  late final String firstName;
  late final String lastName;
  late final int age;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  String? get avatarUrl => null;

  void add(UserProfile userProfile) {}
}
