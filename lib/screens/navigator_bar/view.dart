import 'package:dalily/screens/profile_page/profile_view.dart';
import 'package:dalily/screens/search_page/search_view.dart';
import 'package:dalily/screens/settings_page/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:dalily/screens/home_page/home_view.dart';

import 'homeBar/view.dart';

class MyNavigatorBar extends StatelessWidget {
  final String title;

  MyNavigatorBar({super.key, required this.title});

  static const List<Widget> pages = [
    HomePageView(),
    SearchPageView(),
    ProfilePageView(),
    SettingsPageView()
  ];
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: PageView.builder(
            itemCount: pages.length,
            controller: controller,
            itemBuilder: (context, index) => pages[index],
          ),
          // pages[currentPage],
        ),
        bottomNavigationBar: HomeBarView(
          controller: controller,
        ));
  }
}
