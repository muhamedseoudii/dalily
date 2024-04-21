import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/settings_list_tile.dart';
import 'package:dalily/features/controllers/profile_controller.dart';
import 'package:dalily/screens/profile_page/change_pass_view.dart';
import 'package:dalily/screens/profile_page/edit_profile_view.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);
  static Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find()..fetchUser();
    return Scaffold(body: Obx(
      () {
        return profileController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                                  style: AppTextStyles.largeTitleBlack22,
                                ),
                              ),
                            ),
                            SizedBox(height: 60.h),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50.r,
                              backgroundImage: NetworkImage(
                                "${profileController.user.value?.data.profileImage}",
                              ),
                            ),
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
                          image: "profileEdit",
                          widget: const Icon(Icons.arrow_forward_ios_outlined),
                          onTap: () {
                            Get.to(() => const EditProfileView());
                          },
                        ),
                        SizedBox(height: 10.h),
                        SettingsListTile(
                          text: "change password".tr,
                          image: "passEdit",
                          widget: const Icon(Icons.arrow_forward_ios_outlined),
                          onTap: () {
                            Get.to(() => const ChangePassView());
                          },
                        ),
                        SizedBox(height: 20.h),
                        FilledButtomEdit(
                          text: "Sign Out".tr,
                          color: const Color(0xff79A3D3),
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
                          text: "delete account".tr,
                          color: const Color(0xffD50000),
                          size: 16.sp,
                          color1: Colors.white,
                          onClick: () {
                            Get.defaultDialog(
                              radius: 16.r,
                              contentPadding: EdgeInsets.all(16),
                              title: 'confirm deletion'.tr,
                              middleText: 'are you sure'.tr,
                              actions: [
                                FilledButtomEdit(
                                  text: "confirm".tr,
                                  color: Colors.red,
                                  size: 16.sp,
                                  color1: Colors.white,
                                  onClick: () {
                                    Get.back(); // Close the dialog
                                    profileController
                                        .deleteAccount()
                                        .then((value) {
                                      if (value) {
                                        clearSharedPreferences();
                                        Get.offAllNamed('/login');
                                      }
                                    });
                                  },
                                ),
                                FilledButtomEdit(
                                  text: "cancel".tr,
                                  color: const Color(0xff79A3D3),
                                  size: 16.sp,
                                  color1: Colors.white,
                                  onClick: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
      },
    ));
  }
}
