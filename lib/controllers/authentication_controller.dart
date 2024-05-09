import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  /// Text Editing Controllers
  late TextEditingController loginEmailController;
  late TextEditingController loginPasswordController;

  /// Initialize Controllers
  void _initializeControllers() {
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
  }

  /// Change Status Bar Settings
  void _changeSystemUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    _changeSystemUIStyle();
    _initializeControllers();
  }

  /// Dispose Controllers
  void _disposeControllers() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }

  @override
  void onClose() {
    _disposeControllers();

    super.onClose();
  }

  /// Method to close or unfocus keyboard
  void closeKeyboard() {
    FocusScope.of(Get.context!).unfocus();
  }
}
