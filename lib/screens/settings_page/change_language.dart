import 'package:dalily/features/controllers/locale_controller.dart';
import 'package:dalily/features/controllers/toggletap_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<bool> isSelected = [true, false];
    final ToggleTabController toggleTabController =
        Get.put(ToggleTabController());
    LocaleController controllerLang = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text("Change Language".tr)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FlutterToggleTab(
                width: 70.w,
                height: 50.h,
                selectedIndex: toggleTabController.selectedIndex.value,
                selectedTextStyle: TextStyle(color: Colors.white),
                unSelectedTextStyle: TextStyle(color: Colors.black),
                selectedBackgroundColors: [Color(0xff79A3D3)],
                unSelectedBackgroundColors: [Colors.white],
                labels: ["English", "عربى"],
                selectedLabelIndex: (index) {
                  toggleTabController.setSelectedIndex(index);
                  if (index == 0) {
                    controllerLang.changeLang("en");
                  } else {
                    controllerLang.changeLang("ar");
                  }
                  // Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Center(
// child: Container(
// height: 50,
// width: 200,
// color: Colors.transparent,
// child: MaterialButton(
// onPressed: () {
// controllerLang.changeLang("en");
// Get.back();
// },
// child: const Text("English"),
// ),
// ),
// ),
// const SizedBox(height: 10),
// const Divider(color: Colors.black, endIndent: 50, indent: 45),
// const SizedBox(height: 10),
// Center(
// child: Container(
// height: 50,
// width: 200,
// color: Colors.transparent,
// child: MaterialButton(
// onPressed: () {
// controllerLang.changeLang("ar");
// Get.back();
// },
// child: const Text("عربى"),
// ),
// ),
// ),
