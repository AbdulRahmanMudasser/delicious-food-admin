import 'package:delicious_food_admin/controllers/add_item_controller.dart';
import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:delicious_food_admin/widgets/add%20food/add_item_text_field.dart';
import 'package:delicious_food_admin/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles/app_text_styles.dart';

class AddFoodPage extends GetView<AddItemController> {
  const AddFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0.hp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => controller.navigateToHomePage(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Add Item",
                        style: AppTextStyles.boldDarkMediumTextStyle(),
                      ),
                      const Spacer(),
                      Obx(
                        () => ReusableButton(
                          onTap: () => controller.uploadItemToFirebaseStorage(),
                          text: "Save",
                          color: Colors.black,
                          width: 20,
                          verticalPadding: 0.5,
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5.0.hp),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () => Container(
                        // alignment: Alignment.center,
                        height: 20.0.hp,
                        width: 45.0.wp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.5.wp),
                        ),
                        padding: EdgeInsets.all(0.5.hp),
                        child: controller.selectedImage.value != null
                            ? Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(2.5.wp),
                                      child: Image.file(
                                        controller.selectedImage.value!,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: IconButton(
                                      onPressed: () => controller.removeSelectedImage(),
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white.withOpacity(0.97),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: IconButton(
                                  onPressed: () => controller.pickImage(),
                                  icon: const Icon(Icons.camera_alt_outlined),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5.0.hp),

                // Item Name
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Text(
                    "Name",
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 1.5.hp),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: AddItemTextField(
                    controller: controller.itemNameController,
                    onEmptyText: "Enter Item's Name",
                  ),
                ),

                SizedBox(height: 1.5.hp),

                // Item Price
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Text(
                    "Price",
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 1.5.hp),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: AddItemTextField(
                    controller: controller.itemPriceController,
                    onEmptyText: "Enter Item's Price",
                  ),
                ),

                SizedBox(height: 1.5.hp),

                // Select Category
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Text(
                    "Select Category",
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 1.5.hp),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                      width: 100.0.wp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5.wp),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          // menuMaxHeight: 20.0.hp,
                          value: controller.selectedCategory.value,
                          style: AppTextStyles.simpleDarkMediumTextStyle(),
                          hint: Text(
                            "Select Category",
                            style: AppTextStyles.boldDarkSmallTextStyle(),
                          ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(2.5.wp),
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          dropdownColor: Colors.white,
                          items: controller.categoryList
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => controller.changeSelectedCategory(value),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 1.5.hp),

                // Item Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Text(
                    "Description",
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 1.5.hp),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: AddItemTextField(
                    controller: controller.itemDescriptionController,
                    onEmptyText: "Enter Item's Description",
                    maxLines: 4,
                  ),
                ),

                SizedBox(height: 1.5.hp),

                // Delivery Time
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Text(
                    "Delivery Time (min)",
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 1.5.hp),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: AddItemTextField(
                    controller: controller.deliveryTimeController,
                    onEmptyText: "Enter Delivery Time",
                  ),
                ),

                SizedBox(height: 1.5.hp),

                // Item Keywords
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Text(
                    "Keywords",
                    style: AppTextStyles.boldDarkSmallTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 1.5.hp),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: AddItemTextField(
                    controller: controller.itemKeywordsController,
                    onEmptyText: "Enter Keywords",
                  ),
                ),

                SizedBox(height: 1.5.hp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
