import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  // success snack bar
  static void showSuccessSnackBar(
    String title,
    String message, {
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    // Get.back();

    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor ?? Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      colorText: foregroundColor ?? Colors.white,
      duration: const Duration(seconds: 5),
      margin: EdgeInsets.only(bottom: 5.0.hp, left: 3.0.wp, right: 3.0.wp),
    );
  }

  // error snack bar
  static void showErrorSnackBar(
    String title,
    String message, {
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    // Get.back();

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: foregroundColor ?? Colors.white,
      backgroundColor: backgroundColor ?? Colors.black,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(bottom: 5.0.hp, left: 3.0.wp, right: 3.0.wp),
    );
  }
}
