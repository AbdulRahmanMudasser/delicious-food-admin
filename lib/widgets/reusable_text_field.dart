import 'package:flutter/material.dart';

import '../utils/styles/app_text_styles.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onEmptyText,
     this.icon,
    required this.obscureText
  });

  final TextEditingController controller;
  final String hintText;
  final String onEmptyText;
  final IconData? icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        hintStyle: AppTextStyles.boldDarkSmallTextStyle(),
      ),
      obscureText: obscureText,
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