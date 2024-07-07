import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import '../utils/styles/app_text_styles.dart';

class ItemHorizontalCard extends StatelessWidget {
  const ItemHorizontalCard({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.onTap,
  });

  final String itemImage;
  final String itemName;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        // elevation: 1,
        borderRadius: BorderRadius.circular(2.5.wp),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.0.hp, horizontal: 1.5.wp),
          child: Row(
            children: [
              Image.asset(
                itemImage,
                width: 34.0.wp,
                height: 12.0.hp,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      itemName,
                      softWrap: true,
                      maxLines: 2,
                      style: AppTextStyles.boldDarkMediumTextStyle(),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
