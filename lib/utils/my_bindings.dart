import 'package:dalily/mvc/controllers/forget_pass_controller.dart';
import 'package:dalily/mvc/controllers/home_controller.dart';
import 'package:dalily/mvc/controllers/items_controller.dart';
import 'package:dalily/mvc/controllers/locale_controller.dart';
import 'package:dalily/mvc/controllers/login_controllers.dart';
import 'package:dalily/mvc/controllers/otp_controller.dart';
import 'package:dalily/mvc/controllers/profile_controller.dart';
import 'package:dalily/mvc/controllers/register_controllers.dart';
import 'package:dalily/mvc/controllers/reset_pass_controller.dart';
import 'package:dalily/mvc/controllers/top_items_controller.dart';
import 'package:dalily/mvc/controllers/url_controller.dart';
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
    Get.put(CategoryController()..fetchCategories());
    Get.put(TopItemController()..fetchItems());
    Get.put(ItemController()..fetchItems());
    Get.put(ProfileController()..fetchUser());
  }
}
