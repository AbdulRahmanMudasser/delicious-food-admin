import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Method to close or unfocus keyboard
  void closeKeyboard() {
    FocusScope.of(Get.context!).unfocus();
  }
}
