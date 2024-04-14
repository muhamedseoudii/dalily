import 'dart:async';
import 'dart:convert';
import 'package:dalily/screens/forget_password/reset_pass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPController extends GetxController {
  final formKey3 = GlobalKey<FormState>();
  TextEditingController controllerOTP = TextEditingController();

  final RxInt remainingTimeCount = 0.obs;
  Timer? timerCount;

  RxInt get remainingTime => remainingTimeCount;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    timerCount?.cancel();
  }

  void startTimer() {
    const int totalTime = 30; // Total time in seconds
    remainingTimeCount.value = totalTime;
    timerCount = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTimeCount.value > 0) {
        remainingTimeCount.value--;
      } else {
        timerCount?.cancel();
      }
    });
  }

  bool get isResendButtonEnabled => remainingTimeCount.value == 0;

  var isLoading = false.obs;
  var errorMessage = RxString('');

  Future<void> verifyEmailOtp() async {
    try {
      isLoading(true);
      var dio = Dio();
      var response = await dio.post(
        "https://dalilalhafr.com/api/auth/verifyEmailOtp",
        data: {
          'email': controllerOTP.text,
        },
      );
      // Handle response
      if (response.statusCode == 200) {
        final data = jsonDecode(response.toString());
        final message = data['message'];
        Get.snackbar(
          'Successful',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', controllerOTP.text);
        prefs.setString('token', data['token']);
      }
      if (kDebugMode) {
        print(response.data);
      }
      Get.offAll(() => const ResetPasswordView());
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
