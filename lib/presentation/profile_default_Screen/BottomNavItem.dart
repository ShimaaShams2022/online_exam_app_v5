
import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';


class BottomNavItem extends BottomNavigationBarItem {
  BottomNavItem(
      String title,
      String iconPath,
      bool isSelected,
      ) : super(
    icon: Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected? AppThemeData.selectBottomNavigationBox:Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        ),
        child: ImageIcon(AssetImage("assets/images/$iconPath"))),
    label: title,
  );

}
