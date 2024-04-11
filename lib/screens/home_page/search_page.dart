import 'package:dalily/component/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: ListView(
            children: [
              Column(
                children: [
                  SearchTextField(
                    controller: controller,
                    text: "Search here".tr,
                    image: "assets/icons/search.svg",
                    hintText: "type Something".tr,
                    onClick: () {
                      controller.clear();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
