import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    ConnectivityResult connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;
    if (connectivityResult == ConnectivityResult.none) {
      print('No internet connection');
      Get.defaultDialog(
        titlePadding: EdgeInsets.all(16.w),
        contentPadding: EdgeInsets.all(16.w),
        title: 'no internet connection'.tr,
        titleStyle: AppTextStyles.largeTitle16,
        middleTextStyle: AppTextStyles.mediumGreyTitle14,
        middleText: 'please connect'.tr,
        barrierDismissible: false,
        confirm: FilledButtomEdit(
          text: "ok".tr,
          color: const Color(0xff79A3D3),
          size: 16.sp,
          color1: Colors.white,
          onClick: () {
            SystemNavigator.pop();
          },
        ),
      );
    } else {
      if (Get.isDialogOpen != null) {
        Get.back(); // Dismiss the dialog if it's open
      }
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
