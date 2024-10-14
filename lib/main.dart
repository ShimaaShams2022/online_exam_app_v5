import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/login/loginscreen.dart';
import 'package:online_exam_app_v5/presentation/profile/profile_screen.dart';
import 'package:online_exam_app_v5/presentation/register/register_screen.dart';

import 'di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LoginScreen.routeName,
      routes: {

        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        ProfileScreen.routeName: (_) => ProfileScreen(),

      },
      theme: AppThemeData.lightTheme,
    );
  }
}
