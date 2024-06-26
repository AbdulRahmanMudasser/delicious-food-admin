import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class AddItemTextField extends StatelessWidget {
  const AddItemTextField({
    super.key,
    required this.controller,
    required this.onEmptyText,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String onEmptyText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.wp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.wp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.wp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.wp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.wp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.wp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 1.5.hp),
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return onEmptyText;
        } else {
          return null;
        }
      },
    );
  }
}
