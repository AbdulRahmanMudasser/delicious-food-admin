import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Method to Close or UnFocus Keyboard
  void closeKeyboard() {
    FocusScope.of(Get.context!).unfocus();
  }

  /// Navigate to Add Food Item Page
  navigateToAddFoodItemPage() {
    Get.toNamed('/addfood');
  }
}
