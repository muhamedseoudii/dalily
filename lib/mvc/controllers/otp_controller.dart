import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
