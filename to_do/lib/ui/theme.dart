import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color skandClr = Colors.cyan;
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xff121212);
const Color darkHeaderClr = Color(0xFF424242);
const Color redErorrContainerClr = Color(0xFFC72C41);
const Color redErorrbubblesClr = Color(0xFF801336);
List<Color> kColors = const [
  Color(0xffAC3931),
  Color(0xffE5D352),
  Color(0xffD9E76C),
  Color(0xff81DFEE),
  Color(0xff7FED75),
  Color(0xffD493D8),
  Color(0xffCDD7D6),
  Color(0xff537D8D),
  Color(0xff3482EE),
  Color(0xff482C3D),
];

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    dialogBackgroundColor: Colors.white,
    brightness: Brightness.light,
    useMaterial3: true,
  );

  static final dark = ThemeData(
    primaryColor: darkHeaderClr,
    dialogBackgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}

TextStyle get bodyStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}

TextStyle get body2Style {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}
