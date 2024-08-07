import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle boldDarkMediumTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldDarkLargeTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldDarkExtraLargeTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 19.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldDarkSmallTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldLightSmallTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle simpleDarkMediumTextStyle() {
    return  TextStyle(
      color: Colors.black,
      fontSize: 12.0.sp,
    );
  }
}