import 'package:dalily/features/controllers/reviews_controller.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ReviewView extends StatelessWidget {
  final ReviewsController reviewsController = Get.put(ReviewsController());
  final String id;

  ReviewView({Key? key, required this.id}) : super(key: key) {
    reviewsController.fetchReviews(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "reviews".tr,
          style: AppTextStyles.largeTitle16,
        ),
      ),
      body: RefreshIndicator(
        color: Color(0xff79A3D3),
        onRefresh: () async {
          reviewsController.fetchReviews(id);
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16).w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  if (reviewsController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (reviewsController.reviews.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/reviewIlustration.png",
                          fit: BoxFit.contain,
                          width: 173.w,
                          height: 142.h,
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: Text(
                            "no reviews found".tr,
                            style: AppTextStyles.largeTitle22,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: reviewsController.reviews.length,
                        itemBuilder: (context, index) {
                          var review = reviewsController.reviews[index];
                          return Card(
                            child: ListTile(
                              leading: Image.network(
                                review.user.profileImage,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                review.user.name,
                                style: AppTextStyles.mediumTitle14,
                              ),
                              subtitle: Text(
                                review.review,
                                style: AppTextStyles.mediumGreyTitle14,
                              ),
                              trailing: Text(
                                review.rating.toString(),
                                style: AppTextStyles.mediumTitleBlue16,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
