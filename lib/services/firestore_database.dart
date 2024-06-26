import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious_food_admin/utils/methods/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireStoreDatabase {
  // Instance of Firestore Database
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Check Admin Credentials
  Future checkAdminCredentials(String email, String password) async {
    await _firebaseFirestore.collection("admin").get().then(
      (snapshot) {
        for (var user in snapshot.docs) {
          if (user.data()['email'] != email) {
            SnackBarUtils.showErrorSnackBar(
              "Error",
              "Email Not Valid",
              backgroundColor: const Color(0xFFededeb),
              foregroundColor: Colors.black,
            );
          } else if (user.data()['password'] != password) {
            SnackBarUtils.showErrorSnackBar(
              "Error",
              "Incorrect Password",
              backgroundColor: const Color(0xFFededeb),
              foregroundColor: Colors.black,
            );
          } else {
            Get.offAllNamed('/home');
            SnackBarUtils.showSuccessSnackBar("Success", "Logged In");
          }
        }
      },
    );
  }

  // Method to Upload Item Details to Firestore Database
  Future uploadItemDetails(Map<String, dynamic> itemDetails, String collectionName) async {
    await _firebaseFirestore.collection(collectionName).add(itemDetails);
  }

  // Method to Upload User Details to Firestore Database
  Future uploadUserDetails(Map<String, dynamic> userDetails, String documentId) async {
    await _firebaseFirestore.collection("users").doc(documentId).set(userDetails);
  }

  // Method to Upload Updated Wallet to Firestore Database
  Future updateUserWallet(String documentId, String wallet) async {
    await _firebaseFirestore.collection("users").doc(documentId).update(
      {
        "Wallet": wallet,
      },
    );
  }
}
