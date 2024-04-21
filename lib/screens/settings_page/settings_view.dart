import 'package:dalily/component/settings_list_tile.dart';
import 'package:dalily/features/controllers/theme_service_controller.dart';
import 'package:dalily/features/controllers/url_controller.dart';
import 'package:dalily/screens/settings_page/change_language.dart';
import 'package:dalily/screens/settings_page/policies_privacy.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:dalily/utils/rating_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    URLController urlController = Get.find();
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "My Settings".tr,
        style: AppTextStyles.largeTitle22,
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => const LanguageView());
                },
                child: SettingsListTile(
                  text: "Language".tr,
                  image: "language",
                  widget: const Icon(Icons.arrow_forward_ios_outlined),
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      BlendMode.srcIn),
                ),
              ),
              SizedBox(height: 15.h),
              SettingsListTile(
                text: "Night mode".tr,
                image: "moon",
                widget: Obx(() => Switch(
                      // activeColor: Color(0xff79A3D3),
                      inactiveTrackColor: Color(0xffE0E0E0),
                      value: themeController.switchValue.value,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      },
                    )),
                colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    BlendMode.srcIn),
              ),
              SizedBox(height: 15.h),
              const Divider(
                  color: Colors.grey,
                  endIndent: 19,
                  indent: 15,
                  thickness: 0.3),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  urlController.launchURL(
                      "https://play.google.com/store/apps/details?id=com.arcodx.dalily");
                },
                child: SettingsListTile(
                  text: "Share the App".tr,
                  image: "share",
                  widget: const Icon(Icons.arrow_forward_ios_outlined),
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      BlendMode.srcIn),
                ),
              ),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return RatingDialog(
                        title: Text('Rate Us'.tr),
                        submitButtonText: 'Submit'.tr,
                        commentHint: 'Tell us your comments'.tr,
                        force: true,
                        enableComment: false,
                        showCloseButton: true,
                        image: Image.asset(
                          'assets/images/dalily.png',
                          fit: BoxFit.contain,
                          width: 85.w,
                          height: 85.h,
                        ),
                        submitButtonTextStyle:
                            const TextStyle(color: Colors.cyan),
                        onSubmitted: (response) {
                          // Handle the rating and comment response here

                          if (kDebugMode) {
                            print('User Rating: ${response.rating}');
                          }

                          if (kDebugMode) {
                            print('User Comment: ${response.comment}');
                          }
                        },
                      );
                    },
                  );
                },
                child: SettingsListTile(
                  text: "Rate the App".tr,
                  image: "filledstar",
                  widget: const Icon(Icons.arrow_forward_ios_outlined),
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      BlendMode.srcIn),
                ),
              ),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  Get.to(() => const PoliciesPrivacyView());
                },
                child: SettingsListTile(
                  text: "Policies & Privacy".tr,
                  image: "polices",
                  widget: const Icon(Icons.arrow_forward_ios_outlined),
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      BlendMode.srcIn),
                ),
              ),
              SizedBox(height: 170.h),
              const Center(
                child: Text(
                  "V1.0 ©DalilAlhafr | by Arcodx",
                  style: AppTextStyles.mediumGreyTitle14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
