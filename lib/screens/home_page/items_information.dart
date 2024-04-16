import 'package:dalily/component/buttom_custom.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/features/controllers/specific_item_controller.dart';
import 'package:dalily/features/model/specific_item_model.dart';
import 'package:dalily/screens/home_page/review_view.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemsInformationView extends StatelessWidget {
  final SpecificItemController specificItemController =
      Get.put(SpecificItemController());
  final String id;

  ItemsInformationView({Key? key, required this.id}) : super(key: key) {
    specificItemController.fetchSpecificItem(id);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    String comment = '';
    double rating = 0.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details".tr,
          style: AppTextStyles.largeTitle16,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: ListView(
            children: [
              Obx(() {
                if (specificItemController.isLoading.isTrue) {
                  return const Center(child: CircularProgressIndicator());
                } else if (specificItemController.isError.isTrue) {
                  return const Center(child: Text('Error loading categories'));
                } else {
                  return SizedBox(
                    height: 700.h,
                    child: ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        SpecificItemData item =
                            specificItemController.specificItemData.value!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Image.network(
                                item.backGroundImage,
                                fit: BoxFit.cover,
                                width: 343.w,
                                height: 168.h,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    Text(
                                      item.ratingsAverage.toString(),
                                      style: AppTextStyles.mediumTitleBlue14,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(
                                            () => ReviewView(id: item.id),
                                          );
                                        },
                                        child: Text(
                                          "reviews".tr,
                                          style:
                                              AppTextStyles.mediumTitleBlue14,
                                        ))
                                  ],
                                ),
                                Text(
                                  item.name.tr,
                                  style: AppTextStyles.mediumTitleBlue14,
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              item.description.tr,
                              style: AppTextStyles.mediumGreyTitle14,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "About The Restaurant".tr,
                              style: AppTextStyles.mediumTitleBlue16,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              item.about.tr,
                              style: AppTextStyles.mediumGreyTitle14,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "picture of us".tr,
                              style: AppTextStyles.mediumTitleBlue16,
                            ),
                            SizedBox(height: 10.h),
                            specificItemController.isLoading.isTrue
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : SizedBox(
                                    height: 200.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: item.images.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.h),
                                          child: SizedBox(
                                            width: 335.w,
                                            height: 168.h,
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Image.network(
                                                item.images[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            SizedBox(height: 30.h),
                            FilledButtomEdit(
                              text: "Rate Us".tr,
                              color: Colors.amber,
                              color1: Colors.black,
                              size: 14.sp,
                              onClick: () {
                                Get.bottomSheet(
                                  backgroundColor: Colors.white,
                                  Padding(
                                    padding: const EdgeInsets.all(20).w,
                                    child: ListView(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Rate Us".tr,
                                              style: AppTextStyles.largeTitle16,
                                            ),
                                            SizedBox(height: 15.h),
                                            RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              glowColor: Colors.yellowAccent,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amberAccent,
                                              ),
                                              onRatingUpdate: (rate) {
                                                rating = rate;
                                              },
                                            ),
                                            SizedBox(height: 50.h),
                                            Text(
                                              "Add Comments".tr,
                                              style: AppTextStyles.largeTitle16,
                                            ),
                                            SizedBox(height: 15.h),
                                            CommentTextField(
                                              text: "type Something".tr,
                                              controller: commentController,
                                            ),
                                            SizedBox(height: 30.h),
                                            FilledButtomEdit(
                                              text: "Rate".tr,
                                              color: Colors.amber,
                                              color1: Colors.black,
                                              size: 14.sp,
                                              onClick: () async {
                                                comment =
                                                    commentController.text;
                                                if (kDebugMode) {
                                                  print(comment);
                                                }
                                                if (rating == 0) {
                                                  Get.snackbar(
                                                    'Message',
                                                    "you must enter your rate",
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    snackPosition:
                                                        SnackPosition.TOP,
                                                    backgroundColor:
                                                        Colors.green,
                                                    colorText: Colors.white,
                                                  );
                                                } else {
                                                  specificItemController
                                                      .sendItemReview(item.id,
                                                          comment, rating)
                                                      .then((value) {
                                                    print(value);
                                                    if (value) {
                                                      Get.back();
                                                      Get.snackbar(
                                                        'Message',
                                                        "your review submitted",
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                        snackPosition:
                                                            SnackPosition.TOP,
                                                        backgroundColor:
                                                            Colors.green,
                                                        colorText: Colors.white,
                                                      );
                                                    } else {
                                                      Get.snackbar(
                                                        'Message',
                                                        "failed to submit review",
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                        snackPosition:
                                                            SnackPosition.TOP,
                                                        backgroundColor:
                                                            Colors.red,
                                                        colorText: Colors.white,
                                                      );
                                                    }
                                                  });
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
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
    );
  }
}
