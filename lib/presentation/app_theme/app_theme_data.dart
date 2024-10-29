


import 'package:flutter/material.dart';

class AppThemeData {

  static const Color primaryColor = Color(0xFF02369C);
  static const Color secondaryColor= Color(0xFF878787);
  static const Color errorColor= Color(0xFFCC1010);
  static const Color hintColor= Color(0xFFA6A6A6);
  static const Color primaryBackgroundColor = Colors.white;
  static const Color textPrimaryColor = Colors.black;
  static const Color textSecondaryColor = Colors.white;
  static const Color dividerColor = Colors.white;
  static const Color selectBottomNavigationBox=Color(0xFFCCD7EB);
  static const Color bottomNavigationBackground=Color(0xFFEDEFF3);
  static const Color greyDarkColor=Color(0xFF535353);
  static const Color cameraBox=Color(0xFF5679BD);





  static final ThemeData lightTheme= ThemeData(

    appBarTheme: AppBarTheme(
      color: Colors.transparent
    ),
    dividerColor:dividerColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily:'Intel' ,
          color: textPrimaryColor
      ),
      headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily:'Intel' ,
          color: textPrimaryColor
      ),
      headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily:'Intel' ,
          color: textPrimaryColor
      ),

      bodyLarge:TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color: textPrimaryColor
      ),
      bodyMedium:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color: textPrimaryColor
      ),

    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: bottomNavigationBackground,
      unselectedLabelStyle:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color: textPrimaryColor
      ),
      selectedLabelStyle:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color: textPrimaryColor
      ),
      selectedItemColor:  primaryColor,
      unselectedItemColor: secondaryColor,
    ),

    scaffoldBackgroundColor: Colors.white,

  );
}