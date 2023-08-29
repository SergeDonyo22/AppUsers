import 'package:app_front_end/view/user_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Profile',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      home: const UserListPage(userProfiles: [],)
    );
  }
}

