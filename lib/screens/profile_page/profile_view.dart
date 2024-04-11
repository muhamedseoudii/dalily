import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/settings_list_tile.dart';
import 'package:dalily/mvc/controllers/image_picker_controller.dart';
import 'package:dalily/mvc/controllers/profile_controller.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    Future<void> clearSharedPreferences() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('email');
    }

    final ImagePickerController controller = Get.put(ImagePickerController());
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/profileBackground.png",
                fit: BoxFit.fill,
                width: 375.w,
                height: 195.h,
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.sp),
                      child: Center(
                        child: Text(
                          "My Account".tr,
                          style: AppTextStyles.largeTitle22,
                        ),
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55.r,
                          child: Obx(() {
                            if (controller.image != null) {
                              return CircleAvatar(
                                radius: 50.r,
                                backgroundImage: FileImage(controller.image!),
                              );
                            } else {
                              return CircleAvatar(
                                backgroundColor: Colors.white60,
                                radius: 50.r,
                                child: Image.network(
                                  "${profileController.user.value?.data.profileImage}",
                                  fit: BoxFit.contain,
                                  height: 70.h,
                                  width: 70.w,
                                ),
                              );
                            }
                          }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 55.sp, top: 62.sp),
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
                                        controller.pickImageFromCamera();
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: Text('Choose from gallery'.tr),
                                      onTap: () {
                                        Get.back();
                                        controller.pickImageFromGallery();
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
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(16).w,
            child: Column(
              children: [
                Text(
                  "${profileController.user.value?.data.name}",
                  style: AppTextStyles.largeTitle16,
                ),
                SizedBox(height: 10.h),
                Text(
                  "${profileController.user.value?.data.email}",
                  style: AppTextStyles.mediumGreyTitle14,
                ),
                SizedBox(height: 20.h),
                SettingsListTile(
                  text: "Edit Profile".tr,
                  image: "profile",
                  widget: const Icon(Icons.arrow_forward_ios_outlined),
                ),
                SizedBox(height: 20.h),
                FilledButtomEdit(
                  text: "Sign Out".tr,
                  color: const Color(0xff424242),
                  size: 16.sp,
                  color1: Colors.white,
                  onClick: () {
                    profileController.signOut().then((value) {
                      if (value) {
                        clearSharedPreferences();
                        Get.offAllNamed('/login');
                      }
                    });
                  },
                ),
                SizedBox(height: 20.h),
                FilledButtomEdit(
                  text: "Delete Account".tr,
                  color: const Color(0xffD50000),
                  size: 16.sp,
                  color1: Colors.white,
                  onClick: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
