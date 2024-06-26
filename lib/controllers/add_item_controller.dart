import 'dart:io';

import 'package:delicious_food_admin/services/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/methods/snack_bar_utils.dart';

class AddItemController extends GetxController {
  /// Text Editing Controllers
  late TextEditingController itemNameController;
  late TextEditingController itemPriceController;
  late TextEditingController itemDescriptionController;
  late TextEditingController itemKeywordsController;
  late TextEditingController deliveryTimeController;

  /// Category List
  final List<String> categoryList = ["None", "Ice-Cream", "Pizza", "Salad", "Burger"];

  /// Select Category
  RxString selectedCategory = "None".obs;

  /// Image Picker Object
  final ImagePicker _imagePicker = ImagePicker();

  /// Picked File
  Rx<File?> selectedImage = Rx<File?>(null);

  /// Saving item
  RxBool isLoading = false.obs;

  /// Method to Pick Image
  Future<void> pickImage() async {
    try {
      XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        selectedImage.value = File(pickedImage.path);

        debugPrint("Selected Image Path - $selectedImage");

        SnackBarUtils.showErrorSnackBar("Success", "Image Selected");
      } else {
        SnackBarUtils.showErrorSnackBar("Error", "No Image Selected");
      }
    } catch (exception) {
      debugPrint(exception.toString());
      SnackBarUtils.showErrorSnackBar("Error", "Error In Selecting Image");
    }
  }

  uploadItemToFirebaseStorage() {
    try {
      isLoading.value = true;

      if (selectedImage.value != null) {
        FirebaseStorageService().uploadToFirebaseStorage(
          itemNameController.text.trim(),
          itemPriceController.text.trim(),
          itemDescriptionController.text.trim(),
          selectedCategory.value.toLowerCase(),
          itemKeywordsController.text.trim(),
          deliveryTimeController.text.trim(),
          selectedImage.value,
        );

        isLoading.value = false;
      } else {

        isLoading.value = false;
        debugPrint("${selectedImage.value} Is Null");
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      SnackBarUtils.showErrorSnackBar("Error", e.toString());
    }
  }

  void clearItemDetails() {
    itemNameController.clear();
    itemDescriptionController.clear();
    itemPriceController.clear();
    itemKeywordsController.clear();
    deliveryTimeController.clear();
    selectedCategory.value = "None";
    selectedImage.value = null;
  }

  void removeSelectedImage() {
    if (selectedImage.value != null) {
      selectedImage.value = null;
    } else {
      SnackBarUtils.showErrorSnackBar("Error", "No Image Selected");
    }
  }

  /// Method to Change Selected Category
  changeSelectedCategory(String? value) {
    selectedCategory.value = value!;
  }

  /// Method to Initialize Text Editing Controllers
  void _initializeControllers() {
    itemNameController = TextEditingController();
    itemPriceController = TextEditingController();
    itemDescriptionController = TextEditingController();
    itemKeywordsController = TextEditingController();
    deliveryTimeController = TextEditingController();
  }

  /// Method to Dispose Text Editing Controllers
  void _disposeControllers() {
    itemNameController.dispose();
    itemPriceController.dispose();
    itemDescriptionController.dispose();
    itemKeywordsController.dispose();
    deliveryTimeController.dispose();
  }

  /// Navigate to Add Food Item Page
  navigateToHomePage() {
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
  }

  @override
  void onClose() {
    _disposeControllers();
    super.onClose();
  }
}
