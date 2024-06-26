import 'package:dalily/component/list_categories.dart';
import 'package:dalily/features/controllers/category_item_controller.dart';
import 'package:dalily/features/model/category_model.dart';
import 'package:dalily/features/model/item_model.dart';
import 'package:dalily/screens/home_page/items_information.dart';
import 'package:dalily/screens/search_page/search_view.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesItemsView extends StatelessWidget {
  final CategoryItemController categoryItemController =
      Get.put(CategoryItemController());
  final CategoryData model;

  CategoriesItemsView({Key? key, required this.model}) : super(key: key) {
    categoryItemController.fetchItemCategories(model.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Most Popular".tr,
          style: AppTextStyles.largeTitle16,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SearchPageView());
            },
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              fit: BoxFit.contain,
              colorFilter:
                  const ColorFilter.mode(Color(0xff79A3D3), BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: Color(0xff79A3D3),
        onRefresh: () async {
          categoryItemController.fetchItemCategories(model.title);
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16).w,
            child: Column(
              children: [
                Obx(() {
                  if (categoryItemController.isLoading.isTrue) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (categoryItemController.isError.isTrue) {
                    return const Center(
                        child: Text('Error loading categories'));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: categoryItemController.categories.length,
                        itemBuilder: (context, index) {
                          ItemData item =
                              categoryItemController.categories[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 400.w,
                                height: 240.w,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => ItemsInformationView(id: item.id),
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16).w,
                                      child: RecommendedPlacesAllComponent(
                                        title: item.name,
                                        desc: item.description,
                                        image: item.backGroundImage,
                                      ),
                                    ),
                                  ),
                                ),
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
      ),
    );
  }
}
