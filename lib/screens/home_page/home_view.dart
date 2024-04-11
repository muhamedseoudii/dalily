import 'package:dalily/component/list_categories.dart';
import 'package:dalily/component/row_text_custom.dart';
import 'package:dalily/mvc/controllers/home_controller.dart';
import 'package:dalily/mvc/controllers/top_items_controller.dart';
import 'package:dalily/mvc/model/top_item_model.dart';
import 'package:dalily/screens/home_page/categories_items.dart';
import 'package:dalily/screens/home_page/items_information.dart';
import 'package:dalily/screens/home_page/search_page.dart';
import 'package:dalily/screens/home_page/see_all_view.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.find();
    final TopItemController itemController = Get.find();
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome,".tr,
                      style: AppTextStyles.largeTitle16,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => const SearchPageView());
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/search.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Text(
                  "We are here to help you achieve what you want!".tr,
                  style: AppTextStyles.mediumGreyTitle14,
                ),
                SizedBox(height: 24.h),
                RowTextComponent(
                  text: "Categories".tr,
                  text1: "See All".tr,
                  onClick: () {
                    Get.to(() => const SeeAllView());
                  },
                ),
                Obx(() {
                  if (controller.isLoading.isTrue) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.isError.isTrue) {
                    return const Center(
                        child: Text('Error loading categories'));
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          final category = controller.categories[index];
                          return SizedBox(
                            width: 90.w,
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                    () => CategoriesItemsView(model: category));
                              },
                              child: ListCategoriesComponent(
                                text: category.title.tr,
                                image: category.image,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
                SizedBox(height: 15.h),
                RowTextComponent(
                  text: "The Most Famous Places".tr,
                  text1: "See All".tr,
                  onClick: () {
                    Get.to(() => const SeeAllView());
                  },
                ),
                SizedBox(height: 10.h),
                Obx(() {
                  if (itemController.isLoading.isTrue) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (itemController.isError.isTrue) {
                    return const Center(
                        child: Text('Error loading categories'));
                  } else {
                    return SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemController.items.length > 3
                            ? 3
                            : itemController.items.length,
                        itemBuilder: (context, index) {
                          TopItemData item = itemController.items[index];
                          return SizedBox(
                            width: 190.w,
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  () => ItemsInformationView(
                                    id: item.id,
                                  ),
                                );
                              },
                              child: RecommendedPlacesComponent(
                                title: item.name.tr,
                                desc: item.description.tr,
                                image: item.backGroundImage,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
                SizedBox(height: 15.h),
                RowTextComponent(
                  text: "Recommended places".tr,
                  text1: "See All".tr,
                  onClick: () {
                    Get.to(() => const SeeAllView());
                  },
                ),
                SizedBox(height: 10.h),
                Obx(() {
                  if (itemController.isLoading.isTrue) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (itemController.isError.isTrue) {
                    return const Center(
                        child: Text('Error loading categories'));
                  } else {
                    return SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemController.items.length > 1
                            ? 2
                            : itemController.items.length,
                        itemBuilder: (context, index) {
                          int reverseIndex =
                              itemController.items.length - index - 1;
                          TopItemData item = itemController.items[reverseIndex];
                          return SizedBox(
                            width: 180.w,
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  () => ItemsInformationView(
                                    id: item.id,
                                  ),
                                );
                              },
                              child: RecommendedPlacesComponent(
                                title: item.name,
                                desc: item.description,
                                image: item.backGroundImage,
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
        ],
      ),
    );
  }
}
