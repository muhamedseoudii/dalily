import 'dart:convert';

import 'package:dalily/screens/forget_password/email_check.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetController extends GetxController {
  final formKey2 = GlobalKey<FormState>();

  TextEditingController controllerEmail = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = RxString('');

  Future<void> forgetPass() async {
    try {
      isLoading(true);
      var dio = Dio();
      var response = await dio.post(
        "https://dalilalhafr.com/api/auth/forgotPassword",
        data: {
          'email': controllerEmail.text,
        },
      );
      // Handle response
      if (response.statusCode == 200) {
        final data = jsonDecode(response.toString());
        final message = data['message'];
        Get.snackbar(
          'Message',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', controllerEmail.text);
        prefs.setString('token', data['token']);
      }
      if (kDebugMode) {
        print(response.data);
      }
      Get.offAll(() => const EmailCheckView());
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
