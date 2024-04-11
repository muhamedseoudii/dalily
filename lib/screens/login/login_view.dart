import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/screens/forget_password/forgetpass_view.dart';
import 'package:dalily/screens/register/register_view.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../mvc/controllers/login_controllers.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode buttonFocusNode = FocusNode();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16).w,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Dalily".tr,
                          style: AppTextStyles.largeTitle22,
                        ),
                      ],
                    ),
                    SizedBox(height: 45.h),
                    Text(
                      "Login".tr,
                      style: AppTextStyles.largeTitle16,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Please login to find what you want..".tr,
                      style: AppTextStyles.mediumGreyTitle14,
                    ),
                    SizedBox(height: 45.h),
                    GetBuilder<LoginController>(
                      builder: (controller) {
                        return Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFieldEdit(
                                controller: controller.controller1,
                                text: "Email".tr,
                                image: "assets/icons/sms.svg",
                                hintText: "Please enter your Email",
                              ),
                              SizedBox(height: 20.h),
                              TextFieldEdit1(
                                  controller1: controller.controller2,
                                  onClick: controller.toggleDesign,
                                  text: "Password".tr,
                                  image: "assets/icons/lock.svg"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const ForgetPasswordView());
                                    },
                                    child: Text(
                                      "Forgot Password?".tr,
                                      style: AppTextStyles.mediumTitle14,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don’t have an account?".tr,
                                    style: AppTextStyles.mediumGreyTitle14,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const RegisterView());
                                    },
                                    child: Text(
                                      "Register".tr,
                                      style: AppTextStyles.mediumTitle14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              Obx(
                                () => controller.isLoading.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                            color: Color(0xff79A3D3)),
                                      )
                                    : FilledButtomEdit(
                                        focusNodes: buttonFocusNode,
                                        text: "Login".tr,
                                        color: const Color(0xff79A3D3),
                                        size: 16,
                                        color1: Colors.white,
                                        onClick: () {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            // Passwords are valid and match
                                            // Perform further actions like saving the password
                                            controller.login();
                                          }
                                        },
                                      ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
