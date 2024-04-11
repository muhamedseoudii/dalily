import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/screens/login/login_view.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassSuccessView extends StatelessWidget {
  const ResetPassSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 220.sp),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.sp, right: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/passSuccess.png",
                      fit: BoxFit.fill),
                  SizedBox(height: 20.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Password changed \nsuccesfully!".tr,
                    style: AppTextStyles.largeTitle22,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Your password has been changed successfully,\nwe will let you know if there are more problems \nwith your account"
                        .tr,
                    style: AppTextStyles.mediumGreyTitle14,
                  ),
                  SizedBox(height: 140.h),
                  FilledButtomEdit(
                      text: "Go to Login".tr,
                      color: const Color(0xff79A3D3),
                      size: 16,
                      color1: Colors.white,
                      onClick: () {
                        Get.offAll(() => const LoginView());
                      }),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
