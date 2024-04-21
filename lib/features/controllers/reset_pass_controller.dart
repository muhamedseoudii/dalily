import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassController extends GetxController {
  final formKey4 = GlobalKey<FormState>();
  bool obscureT = true;
  bool obscureT1 = true;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = RxString('');

  toggleDesign() {
    obscureT = !obscureT;
    update();
  }

  toggleDesign1() {
    obscureT1 = !obscureT1;
    update();
  }

  Future<void> changePass() async {
    try {
      isLoading(true);
      var dio = Dio(BaseOptions(
        receiveDataWhenStatusError: true,
      ));
      var response = await dio.patch(
        "https://dalilalhafr.com/api/auth/resetPassword",
        data: {
          'password': controller1.text,
          'passwordConfirm': controller2.text,
        },
      );
      // Handle response
      print(response.data);
      if (response.statusCode == 200) {
        Get.offAllNamed('/login');
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
        final data = e.response!.data;
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
    } catch (e, st) {
      // Handle other types of exceptions
      errorMessage(e.toString());
      if (kDebugMode) {
        print('Error: $e');
        print(st);
      }
    } finally {
      isLoading(false);
    }
  }
}
