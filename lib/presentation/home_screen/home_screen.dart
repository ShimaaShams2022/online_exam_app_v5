import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/login/loginscreen.dart';
import 'package:online_exam_app_v5/presentation/utilities/text_utilities.dart';

import '../app_theme/app_theme_data.dart';
import '../register/register_screen.dart';
import '../utilities/size_utilities.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(TextUtilities.appName,style:AppThemeData.lightTheme.textTheme.headlineLarge,),
            SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, LoginScreen.routeName);
            },  style:ElevatedButton.styleFrom(
              //minimumSize: Size(double.infinity,MediaQuery.of(context).size.height*appSize.bottomWidthRatio),
                backgroundColor:AppThemeData.primaryColor
            ),
                child:  Text(TextUtilities.loginButton,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    color:AppThemeData.textSecondaryColor,
                  )
                  ),
           ),
            SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(TextUtilities.askIfHaveAccount,
                  style: TextStyle(
                      color:AppThemeData.textPrimaryColor
                  ),),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,RegisterScreen.routeName);
                  },
                  child: const Text(
                    TextUtilities.signUpButton,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color:AppThemeData.primaryColor,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
