import 'dart:io';

import 'package:delicious_food_admin/controllers/add_item_controller.dart';
import 'package:delicious_food_admin/services/firestore_database.dart';
import 'package:delicious_food_admin/utils/methods/snack_bar_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class FirebaseStorageService {
  /// Instance of Firebase Storage
  final Reference _reference = FirebaseStorage.instance.ref();

  uploadToFirebaseStorage(
      String name, String price, String description, String category, String keywords, String deliveryTime,
      [File? image]) async {
    if (image != null &&
        name.isNotEmpty &&
        price.isNotEmpty &&
        description.isNotEmpty &&
        keywords.isNotEmpty &&
        category != "None" &&
        deliveryTime.isNotEmpty) {
      String id = randomAlphaNumeric(10);

      debugPrint(id.toString());

      final location = _reference.child("item-images").child(id);

      final UploadTask uploadTask = location.putFile(image);

      final downloadUrl = await (await uploadTask).ref.getDownloadURL();

      Map<String, dynamic> itemDetails = {
        'downloadUrl': downloadUrl,
        'name': name,
        'price': price,
        'description': description,
        'keywords': keywords,
        'category': category,
        'deliveryTime' : deliveryTime,
      };

      await FireStoreDatabase().uploadItemDetails(itemDetails, category).then(
        (value) {
          Get.find<AddItemController>().clearItemDetails();
          SnackBarUtils.showSuccessSnackBar("Success", "Item Added");
        },
      ).onError((error, stackTrace) {
        SnackBarUtils.showSuccessSnackBar("Failure", "Item Not Added");
      });
    } else {
      SnackBarUtils.showSuccessSnackBar("Failure", "Fill All Information");
    }
  }
}
