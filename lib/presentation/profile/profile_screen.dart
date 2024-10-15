import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.email,super.key});

  static const String routeName = "ProfileScreen";

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
          child: Text("Welcome, $email")
      ),
    );

  }
}
