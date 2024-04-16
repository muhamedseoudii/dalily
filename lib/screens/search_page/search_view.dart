import 'package:dalily/component/list_categories.dart';
import 'package:dalily/component/text_field_custom.dart';
import 'package:dalily/features/controllers/search_controller.dart';
import 'package:dalily/features/model/search_model.dart';
import 'package:dalily/screens/home_page/items_information.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchItemController searchItemController =
        Get.put(SearchItemController());
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: Column(
            children: [
              SearchTextField(
                controller: controller,
                text: "Search here".tr,
                image: "assets/icons/search.svg",
                hintText: "type Something".tr,
                onClick: () {
                  controller.clear();
                },
                onChanged: (query) {
                  searchItemController.fetchSearchResults(query);
                },
              ),
              SizedBox(height: 50.h),
              Obx(() {
                if (searchItemController.search.isEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/searchNotFound.png",
                        fit: BoxFit.contain,
                        width: 173.w,
                        height: 142.h,
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Text(
                          "no items found".tr,
                          style: AppTextStyles.largeTitle22,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: searchItemController.search.length,
                      itemBuilder: (context, index) {
                        SearchData searchItem =
                            searchItemController.search[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 400.w,
                              height: 240.w,
                              child: InkWell(
                                onTap: () {
                                  Get.to(
                                    () => ItemsInformationView(
                                      id: searchItem.id,
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16).w,
                                    child: RecommendedPlacesAllComponent(
                                      title: searchItem.name,
                                      desc: searchItem.description,
                                      image: searchItem.backgroundImage,
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
              })
            ],
          ),
        ),
      ),
    );
  }
}
