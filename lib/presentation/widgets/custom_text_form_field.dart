import 'package:flutter/material.dart';

import '../app_theme/app_theme_data.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String? Function(String?) validator;
  final bool obscureText;


  CustomTextFormField({
    required this.controller,
    required this.label,
    required this.hintText,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: TextStyle(color: AppThemeData.hintColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppThemeData.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color:AppThemeData.errorColor),
        ),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}