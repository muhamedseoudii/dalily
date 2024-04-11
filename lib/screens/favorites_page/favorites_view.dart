import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewPageView extends StatelessWidget {
  const ReviewPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 260.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/favorites.png",
                fit: BoxFit.cover,
                height: 230.h,
                width: 200.w,
              ),
              SizedBox(height: 20.h),
              Text(
                "There is no Reviews yet".tr,
                style: AppTextStyles.largeTitle22,
              ),
              SizedBox(height: 12.h),
              Text(
                textAlign: TextAlign.center,
                "Please rate to save favorites reviews here".tr,
                style: AppTextStyles.mediumGreyTitle14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
