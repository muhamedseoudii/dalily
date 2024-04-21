import 'package:dalily/features/controllers/theme_service_controller.dart';
import 'package:dalily/screens/profile_page/profile_view.dart';
import 'package:dalily/src/app_root.dart';
import 'package:dalily/utils/dependancy_injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? pref;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDio();
  initSharedPreferences().then((prefs) {
    pref = prefs;
    runApp(const AppRoot());
    DependencyInjection.init();
    Get.putAsync(() => ThemeController().loadThemeFromPreferences());
  });
}

Future<SharedPreferences> initSharedPreferences() async {
  return await SharedPreferences.getInstance();
}

Dio dio = Dio(BaseOptions(
  receiveDataWhenStatusError: true,
  validateStatus: (status) => true,
));

void setupDio() {
  dio.interceptors.add(InterceptorsWrapper(
    onResponse: (response, handler) async {
      // Check if the response status is 401 (unauthorized)
      if (response.statusCode == 401) {
        await ProfilePageView.clearSharedPreferences();

        // Redirect the user to the login screen
        // Replace '/login' with your actual login route
        Get.offAllNamed('/login');
      }
      return handler.next(response);
    },
  ));
}
