import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/features/controllers/otp_controller.dart';
import 'package:dalily/screens/forget_password/reset_pass.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OTPView extends StatelessWidget {
  const OTPView({Key? key}) : super(key: key);

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
                    "Enter the code we have sent".tr,
                    style: AppTextStyles.largeTitle22,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Please confirm your account by entering the authorization code we have sent to your email"
                        .tr,
                    style: AppTextStyles.mediumGreyTitle14,
                  ),
                  SizedBox(height: 40.h),
                  GetBuilder<OTPController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldEdit(
                              controller: controller.controllerOTP,
                              text: "OTP".tr,
                              image: "assets/icons/OTP.svg",
                              hintText: "Please enter the code".tr,
                            ),
                            SizedBox(height: 30.h),
                            Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.remainingTime.value > 0
                                        ? "Resend code in ${controller.remainingTime.value} seconds"
                                            .tr
                                        : "Resend code".tr,
                                    style: AppTextStyles.mediumGreyTitle14,
                                  ),
                                  TextButton(
                                    onPressed: controller.isResendButtonEnabled
                                        ? () {
                                            // Implement resend code logic here
                                            controller.startTimer();
                                          }
                                        : null,
                                    child: Text(
                                      "Resend Code".tr,
                                      style: AppTextStyles.mediumTitleBlue14
                                          .copyWith(
                                        color:
                                            controller.remainingTime.value > 0
                                                ? Colors.grey
                                                : const Color(0xff79A3D3),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            SizedBox(height: 50.h),
                            FilledButtomEdit(
                              text: "Verify".tr,
                              color: const Color(0xff79A3D3),
                              size: 16,
                              color1: Colors.white,
                              onClick: () {
                                if (controller.formKey3.currentState!
                                    .validate()) {
                                  // Passwords are valid and match
                                  // Perform further actions like saving the password
                                  controller.verifyEmailOtp();
                                  // Get.to(() => const ResetPasswordView());
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
