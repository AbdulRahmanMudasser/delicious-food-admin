import 'package:delicious_food_admin/controllers/home_controller.dart';
import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:delicious_food_admin/widgets/item_horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles/app_text_styles.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0.hp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.0.hp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Text(
                    "Admin Panel",
                    style: AppTextStyles.boldDarkExtraLargeTextStyle(),
                  ),
                ),
                SizedBox(
                  height: 5.0.hp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: ItemHorizontalCard(
                    itemImage: "assets/images/food.jpg",
                    itemName: "Add Food Items",
                    onTap: () => controller.navigateToAddFoodItemPage(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
