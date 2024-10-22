import 'package:flutter/material.dart';

import '../../domain/models/user.dart';

class ProfileDefaultScreen extends StatelessWidget {
   ProfileDefaultScreen({required this.appUser,super.key});

  static const String routeName = "ProfileDefaultScreen";

  User appUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
          child: Text("Welcome, ${appUser.email}")
      ),
    );

  }
}
