import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/forget_password/forget_password_screen.dart';
import 'package:online_exam_app_v5/presentation/forget_password/reset_password_screen.dart';
import 'package:online_exam_app_v5/presentation/forget_password/verify_screen.dart';
import 'package:online_exam_app_v5/presentation/home_screen/home_screen.dart';
import 'package:online_exam_app_v5/presentation/login/loginscreen.dart';

import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/exam_questions_screen.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/exam_score_screen.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exams/exam_start_screen.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exams/exams_screen.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/profile_default_screen.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/user_profile/change_password_screen.dart';

import 'package:online_exam_app_v5/presentation/register/register_screen.dart';
import 'package:online_exam_app_v5/presentation/utilities/user_with_token.dart';

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
      initialRoute:HomeScreen.routeName,
      routes: {

        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
       VerifyScreen.routeName: (_) => VerifyScreen(),
        ExamsScreen.routeName: (_) => ExamsScreen(),
        ProfileDefaultScreen.routeName: (context){
          final args=ModalRoute.of(context)!.settings.arguments as UserWithToken;
          return ProfileDefaultScreen(userWithToken:args );
        },
        ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
       ResetPasswordScreen.routeName: (_) => ResetPasswordScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ExamStartScreen.routeName: (_) => ExamStartScreen(),
        ExamQuestionsScreen.routeName: (_) =>ExamQuestionsScreen(),
        ExamScoreScreen.routeName:(_)=>ExamScoreScreen(),
        ChangePasswordScreen.routeName:(_)=>ChangePasswordScreen(),



      },
      theme: AppThemeData.lightTheme,
    );
  }
}
