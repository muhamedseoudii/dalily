import 'package:dalily/features/controllers/forget_pass_controller.dart';
import 'package:dalily/features/controllers/home_controller.dart';
import 'package:dalily/features/controllers/items_controller.dart';
import 'package:dalily/features/controllers/locale_controller.dart';
import 'package:dalily/features/controllers/login_controllers.dart';
import 'package:dalily/features/controllers/otp_controller.dart';
import 'package:dalily/features/controllers/profile_controller.dart';
import 'package:dalily/features/controllers/register_controllers.dart';
import 'package:dalily/features/controllers/reset_pass_controller.dart';
import 'package:dalily/features/controllers/theme_service_controller.dart';
import 'package:dalily/features/controllers/toggletap_contoller.dart';
import 'package:dalily/features/controllers/top_items_controller.dart';
import 'package:dalily/features/controllers/url_controller.dart';
import 'package:get/get.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(URLController());
    Get.put(LocaleController());
    Get.put(ForgetController());
    Get.put(OTPController());
    Get.put(ResetPassController());
    Get.put(CategoryController());
    Get.put(TopItemController());
    Get.put(ItemController());
    Get.put(ProfileController());
    Get.put(ThemeController());
  }
}
