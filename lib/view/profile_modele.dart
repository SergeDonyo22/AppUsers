import 'package:flutter/material.dart';

class UserProfile {
  late final IconData iconData;
  late final String firstName;
  late final String lastName;
  late final int age;

  UserProfile({
    required this.iconData,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  static void removeAt(int index) {}
}
