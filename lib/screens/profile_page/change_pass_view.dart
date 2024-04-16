import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/features/controllers/change_pass_controller.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePassController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "change password".tr,
          style: AppTextStyles.largeTitle16,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: ListView(
            children: [
              Column(
                children: [
                  GetBuilder<ChangePassController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFieldEdit4(
                                controller1: controller.controller1,
                                onClick: controller.toggleDesign,
                                text: "enter your current password".tr,
                                icon: Icon(controller.obscureT
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                obscureText: controller.obscureT,
                                image: "assets/icons/lock.svg"),
                            SizedBox(height: 15.h),
                            TextFieldEdit4(
                                controller1: controller.controller2,
                                onClick: controller.toggleDesign1,
                                text: "enter your new password".tr,
                                icon: Icon(controller.obscureT1
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                obscureText: controller.obscureT1,
                                image: "assets/icons/lock.svg"),
                            SizedBox(height: 20.h),
                            TextFieldEdit3(
                              text: "enter confirm new password".tr,
                              onClick: controller.toggleDesign2,
                              icon: Icon(controller.obscureT2
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              obscureText: controller.obscureT2,
                              image: "assets/icons/lock.svg",
                              controller3: controller.controller3,
                              controller4: controller.controller2,
                            ),
                            SizedBox(height: 50.h),
                            Obx(
                              () => controller.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                          color: Color(0xff79A3D3)),
                                    )
                                  : FilledButtomEdit(
                                      text: "save".tr,
                                      color: const Color(0xff79A3D3),
                                      size: 16,
                                      color1: Colors.white,
                                      onClick: () {
                                        if (controller.formKey6.currentState!
                                            .validate()) {
                                          // Passwords are valid and match
                                          // Perform further actions like saving the password
                                          controller.changePass();
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
            ],
          ),
        ),
      ),
    );
  }
}
