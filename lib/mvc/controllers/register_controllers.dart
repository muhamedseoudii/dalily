import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final formKey1 = GlobalKey<FormState>();
  bool obscureT = true;
  bool obscureT1 = true;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  toggleDesign() {
    obscureT = !obscureT;
    update();
  }

  toggleDesign1() {
    obscureT1 = !obscureT1;
    update();
  }

  var isLoading = false.obs;
  var errorMessage = RxString('');
  var token = ''.obs;

  Future<void> register() async {
    try {
      isLoading(true);
      var dio = Dio();
      var response = await dio.post(
        'https://dalilalhafr.com/api/auth/signUp',
        data: {
          'name': controller3.text,
          'email': controller1.text,
          'password': controller2.text,
          'passwordConfirm': controller4.text
        },
      );
      // Handle response
      token(response.data['token']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', controller1.text);
      prefs.setString('token', response.data['token']);
      Get.snackbar("Register", "Successfully");
      if (kDebugMode) {
        print(response.data);
      }
      Get.offAllNamed('/home');
    } on DioException catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx
        errorMessage(e.response!.data.toString());
        if (kDebugMode) {
          print(
              'Error ${e.response!.statusCode}: ${e.response!.statusMessage}');
        }
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
