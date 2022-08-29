import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
const kPrimaryLightColor = Color(0xFFF1E6FF);

class Appcolors {
  static const Color black = Color(0xFF323649);
  static const Color white = Colors.white;
  static const Color bleu = Color(0xFF49C9EB);
  static const Color yellow = Color(0xFFFFA944);
  static const Color purple = Color(0xFF6F35A5);
  static const Color pink = Color(0xFFF65A8A);
}

class Themes {
  static final light = ThemeData(
    primaryColor: Appcolors.purple,
    backgroundColor: white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: Appcolors.purple,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get headingStyle {
  return TextStyle(
      fontSize: 25,
      fontFamily: 'Montserrat',
      color: Get.isDarkMode ? white : Appcolors.black,
      fontWeight: FontWeight.w600);
}

TextStyle get supHeadingStyle {
  return TextStyle(
      fontSize: 25,
      fontFamily: 'Montserrat',
      color: Get.isDarkMode ? white : Appcolors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get bodyStyle {
  return TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat',
      color: Get.isDarkMode ? white : Appcolors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get subBodyStyle {
  return TextStyle(
      fontSize: 17,
      fontFamily: 'Montserrat',
      color: Get.isDarkMode ? white : Appcolors.black,
      fontWeight: FontWeight.w400);
}
