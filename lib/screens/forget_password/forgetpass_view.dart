import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/features/controllers/forget_pass_controller.dart';
import 'package:dalily/screens/forget_password/email_check.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            "Dalily".tr,
            style: AppTextStyles.largeTitle22,
          ),
          Container(width: 16.w),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget Password".tr,
                    style: AppTextStyles.largeTitle22,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Enter the email address you used when you joined and we’ll send you instructions to reset your password."
                        .tr,
                    style: AppTextStyles.mediumGreyTitle14,
                  ),
                  SizedBox(height: 40.h),
                  GetBuilder<ForgetController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldEdit(
                              controller: controller.controllerEmail,
                              text: "Email".tr,
                              image: "assets/icons/sms.svg",
                              hintText: "Please enter your Email",
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "You remember your password".tr,
                                  style: AppTextStyles.mediumGreyTitle14,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Login".tr,
                                    style: AppTextStyles.mediumTitleBlue14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                            FilledButtomEdit(
                              text: "rest password".tr,
                              color: const Color(0xff79A3D3),
                              size: 16,
                              color1: Colors.white,
                              onClick: () {
                                if (controller.formKey2.currentState!
                                    .validate()) {
                                  // Passwords are valid and match
                                  // Perform further actions like saving the password
                                  controller.forgetPass();
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
