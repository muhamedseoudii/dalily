import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool obscureT = true;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  toggleDesign() {
    obscureT = !obscureT;
    update();
  }

  var isLoading = false.obs;
  var errorMessage = RxString('');

  Future<void> login() async {
    try {
      isLoading(true);
      var dio = Dio();
      var response = await dio.post(
        "https://dalilalhafr.com/api/auth/login",
        data: {
          'email': controller1.text,
          'password': controller2.text,
        },
      );
      // Handle response
      if (response.statusCode == 200) {
        final data = response.data;
        final message = data['message'];
        Get.offAllNamed('/home');
        Get.snackbar(
          'Message',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', controller1.text);
        prefs.setString('token', data['token']);
      }
      if (kDebugMode) {
        print(response.data);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx
        errorMessage(e.response!.data.toString());
        if (kDebugMode) {
          print(
              'Error ${e.response!.statusCode}: ${e.response!.statusMessage}');
        }
        final data = jsonDecode(e.response!.toString());
        final message = data['message'];
        Get.snackbar(
          'Failed',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        errorMessage(e.message);
        if (kDebugMode) {
          print('Error: ${e.message}');
        }
      }
    } catch (e) {
      // Handle other types of exceptions
      errorMessage(e.toString());
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
