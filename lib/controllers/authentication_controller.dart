import 'package:delicious_food_admin/services/firestore_database.dart';
import 'package:delicious_food_admin/utils/methods/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  /// Text Editing Controllers
  late TextEditingController loginEmailController;
  late TextEditingController loginPasswordController;

  /// Instance of Firestore Database Class
  final FireStoreDatabase _fireStoreDatabase = FireStoreDatabase();

  /// Loading
  RxBool isLoading = false.obs;

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

  /// Method to Check Admin Credentials
  loginAdmin(TextEditingController emailController, TextEditingController passwordController) async {
    try {
      isLoading.value = true;

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      await _fireStoreDatabase.checkAdminCredentials(email, password);

      isLoading.value = false;
    } catch (exception) {
      isLoading.value = false;

      SnackBarUtils.showErrorSnackBar("Error", exception.toString());
    }
  }
}
