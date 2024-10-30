

import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/user_profile/change_password_screen.dart';

import '../app_theme/app_theme_data.dart';

class FixedPasswordField extends StatelessWidget {

  final String label;
  String token;

  FixedPasswordField({
    required this.label,
    required this.token,

  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppThemeData.greyDarkColor,
              )
            ),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon:  Row(
                  children: [
                    SizedBox(width: 20),
                    Row(
                      children: List.generate(
                        8,
                            (index) => Icon(Icons.star, color: AppThemeData.greyDarkColor ,size: 16),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context,ChangePasswordScreen.routeName,arguments: token);
                      },
                      child: Text('Change', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              enabled:  true,
            ),
          ),
        ),




      ],
    );
  }
}