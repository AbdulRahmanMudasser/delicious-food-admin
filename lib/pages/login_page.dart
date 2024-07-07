import 'package:delicious_food_admin/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';
import '../utils/styles/app_text_styles.dart';
import '../widgets/reusable_button.dart';
import '../widgets/reusable_text_field.dart';

class LoginPage extends GetView<AuthenticationController> {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 100.0.wp, // 100% of screen
              height: 65.0.hp, // 50% of screen
              decoration: const BoxDecoration(
                color: Color(0xFFededeb),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50.0.hp,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 53, 51, 51),
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8.0.wp),
                  right: Radius.circular(8.0.wp),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.0.hp,
            left: 0,
            right: 0,
            child: Text(
              "Let's Start With Admin!",
              style: AppTextStyles.boldDarkExtraLargeTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 20.0.hp,
            left: 5.5.wp,
            right: 5.5.wp,
            height: 45.0.hp,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(4.5.wp),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 4.0.hp),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // login text
                      Text(
                        "Login",
                        style: AppTextStyles.boldDarkLargeTextStyle().copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          fontSize: 17.6.sp,
                        ),
                      ),

                      const Spacer(),

                      // email text field
                      ReusableTextFormField(
                        controller: controller.loginEmailController,
                        hintText: "Email",
                        onEmptyText: "Please Enter Your Email",
                        icon: Icons.email_outlined,
                        obscureText: false,
                      ),

                      SizedBox(
                        height: 3.0.hp,
                      ),

                      // password text field
                      ReusableTextFormField(
                        controller: controller.loginPasswordController,
                        hintText: "Password",
                        onEmptyText: "Please Enter Your Password",
                        icon: Icons.lock_outlined,
                        obscureText: true,
                      ),

                      SizedBox(
                        height: 4.0.hp,
                      ),

                      const Spacer(),

                      // login button
                      Obx(() {
                        return ReusableButton(
                          text: "LOGIN",
                          color: Colors.black,
                          isLoading: controller.isLoading.value,
                          onTap: () async {
                            controller.closeKeyboard();

                            if (_formKey.currentState!.validate()) {
                              controller.loginAdmin(
                                controller.loginEmailController,
                                controller.loginPasswordController,
                              );
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
