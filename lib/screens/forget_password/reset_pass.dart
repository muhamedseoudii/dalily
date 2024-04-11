import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/mvc/controllers/reset_pass_controller.dart';
import 'package:dalily/screens/forget_password/reset_pass_success.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

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
                    "Create new password".tr,
                    style: AppTextStyles.largeTitle22,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Set your new password so you can login and access Dalily"
                        .tr,
                    style: AppTextStyles.mediumGreyTitle14,
                  ),
                  SizedBox(height: 40.h),
                  GetBuilder<ResetPassController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldEdit4(
                                controller1: controller.controller1,
                                onClick: controller.toggleDesign,
                                text: "Password".tr,
                                icon: Icon(controller.obscureT
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                obscureText: controller.obscureT,
                                image: "assets/icons/lock.svg"),
                            SizedBox(height: 20.h),
                            TextFieldEdit3(
                              text: "Confirm Password".tr,
                              onClick: controller.toggleDesign1,
                              icon: Icon(controller.obscureT1
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              obscureText: controller.obscureT1,
                              image: "assets/icons/lock.svg",
                              controller3: controller.controller2,
                              controller4: controller.controller1,
                            ),
                            SizedBox(height: 50.h),
                            FilledButtomEdit(
                              text: "Reset Password".tr,
                              color: const Color(0xff79A3D3),
                              size: 16,
                              color1: Colors.white,
                              onClick: () {
                                if (controller.formKey4.currentState!
                                    .validate()) {
                                  // Passwords are valid and match
                                  // Perform further actions like saving the password
                                  // controller.login();
                                  // Get.to(() => const EmailCheckView());
                                  Get.offAll(
                                      () => const ResetPassSuccessView());
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
            )
          ],
        ),
      ),
    );
  }
}
