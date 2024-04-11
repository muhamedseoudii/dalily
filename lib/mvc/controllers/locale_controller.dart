import 'package:dalily/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  // Future<void> initSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  // }

  Locale inialLang =
      pref?.getString("lang") == "ar" ? const Locale("ar") : const Locale("en");

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    pref?.setString("lang", codeLang);
    Get.updateLocale(locale);
  }
}
