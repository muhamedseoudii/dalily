import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/features/controllers/edit_profile_controller.dart';
import 'package:dalily/features/controllers/profile_controller.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    final controller = Get.put(EditProfileController());
    controller.controller1.text = profileController.user.value?.data.name ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile".tr,
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
                  GetBuilder<EditProfileController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              fit: StackFit.passthrough,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 55.r,
                                  child: Obx(() {
                                    if (controller.image != null) {
                                      return CircleAvatar(
                                        radius: 50.r,
                                        backgroundImage:
                                            FileImage(controller.image!),
                                      );
                                    } else {
                                      return CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 50.r,
                                        backgroundImage: NetworkImage(
                                          "${profileController.user.value?.data.profileImage}",
                                        ),
                                      );
                                    }
                                  }),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.bottomSheet(
                                        backgroundColor: Colors.white,
                                        Wrap(
                                          children: [
                                            ListTile(
                                              leading: const Icon(Icons.camera),
                                              title: Text('Take a photo'.tr),
                                              onTap: () {
                                                Get.back();
                                                controller
                                                    .pickImageFromCamera();
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.photo),
                                              title: Text(
                                                  'Choose from gallery'.tr),
                                              onTap: () {
                                                Get.back();
                                                controller
                                                    .pickImageFromGallery();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.camera_alt),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            TextFieldEdit(
                              controller: controller.controller1,
                              labelText: "enter your new name".tr,
                              image: "assets/icons/profile.svg",
                              icon: const Icon(Icons.edit),
                              validateText: "please enter your name".tr,
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
                                        if (controller.formKey5.currentState!
                                            .validate()) {
                                          // Passwords are valid and match
                                          // Perform further actions like saving the password
                                          controller.updateProfile();
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
