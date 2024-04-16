import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/features/controllers/register_controllers.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // RegisterController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16).w,
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
                  "Create Account".tr,
                  style: AppTextStyles.largeTitle16,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Please create an account to find what you want..".tr,
                  style: AppTextStyles.mediumGreyTitle14,
                ),
                SizedBox(height: 45.h),
                GetBuilder<RegisterController>(
                  builder: (controller) {
                    return Form(
                      key: controller.formKey1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldEdit2(
                              text: "Name".tr,
                              image: "assets/icons/profile.svg",
                              controller: controller.controller3),
                          SizedBox(height: 20.h),
                          TextFieldEdit(
                            controller: controller.controller1,
                            labelText: "Email".tr,
                            image: "assets/icons/sms.svg",
                            validateText: "Please enter your Email",
                          ),
                          SizedBox(height: 20.h),
                          TextFieldEdit4(
                              controller1: controller.controller2,
                              onClick: controller.toggleDesign,
                              icon: Icon(controller.obscureT
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              obscureText: controller.obscureT,
                              text: "Password".tr,
                              image: "assets/icons/lock.svg"),
                          SizedBox(height: 20.h),
                          TextFieldEdit3(
                            text: "Confirm Password".tr,
                            onClick: controller.toggleDesign1,
                            image: "assets/icons/lock.svg",
                            icon: Icon(controller.obscureT1
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            obscureText: controller.obscureT1,
                            controller4: controller.controller2,
                            controller3: controller.controller4,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?".tr,
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
                          SizedBox(height: 60.h),
                          Obx(
                            () => controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: Color(0xff79A3D3)),
                                  )
                                : FilledButtomEdit(
                                    text: "Create Account".tr,
                                    color: const Color(0xff79A3D3),
                                    size: 16,
                                    color1: Colors.white,
                                    onClick: () {
                                      if (controller.formKey1.currentState!
                                          .validate()) {
                                        // Passwords are valid and match
                                        // Perform further actions like saving the password
                                        controller.register();
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
      ),
    );
  }
}
