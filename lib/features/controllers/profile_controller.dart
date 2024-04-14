import 'package:dalily/features/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<ProfileModel?> user = Rx<ProfileModel?>(null);
  RxBool isError = false.obs;

  Future<void> fetchUser() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      final response = await dio.get(
        "https://dalilalhafr.com/api/auth/profilePage",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      var data = response.data;
      if (data != null) {
        user.value = ProfileModel.fromJson(data);
        isError(false);
      } else {
        isError(true);
      }
    } catch (error) {
      isError(true);
    } finally {
      isLoading(false);
    }
  }

  Future<bool> signOut() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      final response = await dio.get(
        "https://dalilalhafr.com/api/auth/logout",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      var data = response.data;
      if (data != null) {
        isError(false);
        return true;
      } else {
        isError(true);
        return false;
      }
    } catch (error) {
      isError(true);
      return false;
    } finally {
      isLoading(false);
    }
  }
}
