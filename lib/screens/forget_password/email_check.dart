import 'dart:async';

import 'package:dalily/screens/forget_password/otp_view.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmailCheckView extends StatefulWidget {
  const EmailCheckView({Key? key}) : super(key: key);

  @override
  State<EmailCheckView> createState() => _EmailCheckViewState();
}

class _EmailCheckViewState extends State<EmailCheckView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.off(() => const OTPView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 260.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/emailIlustration.png", fit: BoxFit.fill),
            SizedBox(height: 20.h),
            Text(
              "Check your Email".tr,
              style: AppTextStyles.largeTitle22,
            ),
            SizedBox(height: 12.h),
            Text(
              textAlign: TextAlign.center,
              "We have sent a reset password to your email \naddress".tr,
              style: AppTextStyles.mediumGreyTitle14,
            ),
          ],
        ),
      )),
    );
  }
}
