import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/styles/app_text_styles.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(1.2.wp),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),

          Text(
            "Add Item",
            style: AppTextStyles.boldDarkMediumTextStyle(),
          ),
        ],
      ),
    );
  }
}
