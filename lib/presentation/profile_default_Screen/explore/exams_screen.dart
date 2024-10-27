import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
   ExamsScreen({super.key});

  static const String routeName = "ExamsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams"),
      ),
      body: Container(color: Colors.red)
    );

  }
}
