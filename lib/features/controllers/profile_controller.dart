import 'package:dalily/features/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class ProfileController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<ProfileModel?> user = Rx<ProfileModel?>(null);
  RxBool isError = false.obs;

  Future<void> fetchUser() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
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

  Future<bool> deleteAccount() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      if (token.isNotEmpty) {
        var dio = Dio();
        final response = await dio.delete(
          'https://dalilalhafr.com/api/auth/deleteAccount',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
        // Account deleted successfully
        final data = response.data;
        final message = data['message'];
        Get.snackbar(
          'Message',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        return true;
      } else {
        // Handle case where token is not found
        isError(true);
        return false;
      }
    } catch (e) {
      // Handle error deleting account
      Get.snackbar(
        'Failed',
        "The account didn't deleted",
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } finally {
      isLoading(false);
    }
  }
}
