import 'package:dalily/component/list_categories.dart';
import 'package:dalily/mvc/controllers/top_items_controller.dart';
import 'package:dalily/mvc/model/top_item_model.dart';
import 'package:dalily/screens/home_page/items_information.dart';
import 'package:dalily/screens/home_page/search_page.dart';
import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TopItemController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "all places".tr,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Obx(() {
                  if (controller.isLoading.isTrue) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.isError.isTrue) {
                    return const Center(
                        child: Text('Error loading categories'));
                  } else {
                    return SizedBox(
                      height: 700.h,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          TopItemData item = controller.items[index];
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
                                        id: item.id,
                                      ),
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
