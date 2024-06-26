import 'package:dalily/features/controllers/locale_controller.dart';
import 'package:dalily/features/controllers/theme_service_controller.dart';
import 'package:dalily/screens/forget_password/forgetpass_view.dart';
import 'package:dalily/screens/login/login_view.dart';
import 'package:dalily/screens/navigator_bar/view.dart';
import 'package:dalily/screens/register/register_view.dart';
import 'package:dalily/screens/settings_page/settings_view.dart';
import 'package:dalily/screens/splash/splash_view.dart';
import 'package:dalily/utils/my_bindings.dart';
import 'package:dalily/utils/my_locale.dart';
import 'package:dalily/utils/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Dalily'.tr,
          debugShowCheckedModeBanner: false,
          locale: controller.inialLang,
          translations: MyLocale(),
          theme: ThemeClass().lightTheme,
          darkTheme: ThemeClass().darkTheme,
          themeMode: ThemeController().isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          initialBinding: MyBindings(),
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => const SplashView(),
            ),
            GetPage(
                name: '/login',
                page: () => const LoginView(),
                binding: MyBindings()),
            GetPage(
                name: '/register',
                page: () => const RegisterView(),
                binding: MyBindings()),
            GetPage(
                name: '/settings',
                page: () => const SettingsPageView(),
                binding: MyBindings()),
            GetPage(
              name: '/home',
              page: () => MyNavigatorBar(
                title: 'Home',
              ),
              binding: MyBindings(),
            ),
            GetPage(
              name: '/search',
              page: () => MyNavigatorBar(
                title: 'Search',
              ),
              binding: MyBindings(),
            ),
            GetPage(
                name: '/forget',
                page: () => const ForgetPasswordView(),
                binding: MyBindings()),
          ],
        );
      },
    );
  }
}
