import 'package:dalily/mvc/controllers/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true, false];
    LocaleController controllerLang = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text("Change Language".tr)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ToggleButtons(
                isSelected: isSelected,
                onPressed: (int index) {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    isSelected[buttonIndex] = buttonIndex == index;
                  }

                  if (index == 0) {
                    controllerLang.changeLang("en");
                  } else {
                    controllerLang.changeLang("ar");
                  }
                  Get.back();
                },
                selectedBorderColor: const Color(0xffE0E0E0),
                borderColor: const Color(0xffE0E0E0),
                borderRadius: BorderRadius.circular(8),
                children: const [
                  SizedBox(
                    width: 175, // Half of the desired width
                    height: 80,
                    child: Center(child: Text("English")),
                  ),
                  SizedBox(
                    width: 175, // Half of the desired width
                    height: 80,
                    child: Center(child: Text("عربى")),
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
