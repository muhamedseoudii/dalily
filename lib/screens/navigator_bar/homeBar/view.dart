import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeBarView extends StatefulWidget {
  final PageController controller;

  const HomeBarView({super.key, required this.controller});

  @override
  State<HomeBarView> createState() => _HomeBarViewState();
}

class _HomeBarViewState extends State<HomeBarView> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentPage = widget.controller.page!.round();
      });
    });
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.transparent,
      shape: const CircularNotchedRectangle(),
      padding: const EdgeInsets.only(top: 12),
      notchMargin: 10,
      elevation: 55,
      child: Row(
        children: [
          ItemBottom(
            isSelected: currentPage == 0,
            unselectedImage: "home",
            image: "home",
            title: "Home".tr,
            onTap: () {
              widget.controller.jumpToPage(0);
              currentPage = 0;
              setState(() {});
            },
          ),
          ItemBottom(
            unselectedImage: "message",
            isSelected: currentPage == 1,
            image: "newSearch",
            title: "Search".tr,
            onTap: () {
              widget.controller.jumpToPage(1);
              currentPage = 1;
              setState(() {});
            },
          ),
          ItemBottom(
              isSelected: currentPage == 2,
              image: "profile",
              unselectedImage: "profile",
              title: "Profile".tr,
              onTap: () {
                widget.controller.jumpToPage(2);
                currentPage = 2;
                setState(() {});
              }),
          ItemBottom(
            isSelected: currentPage == 3,
            image: "settings",
            unselectedImage: "Settings",
            title: "Settings".tr,
            onTap: () {
              widget.controller.jumpToPage(3);
              currentPage = 3;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class ItemBottom extends StatelessWidget {
  final String title, image, unselectedImage;
  final VoidCallback onTap;
  final bool isSelected;

  const ItemBottom(
      {Key? key,
      required this.title,
      required this.image,
      required this.onTap,
      this.isSelected = false,
      required this.unselectedImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/$image.svg",
              colorFilter: ColorFilter.mode(
                  isSelected
                      ? const Color(0xff79A3D3)
                      : const Color(0xff8A8A8E),
                  BlendMode.srcIn),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: isSelected
                      ? const Color(0xff79A3D3)
                      : const Color(0xff8A8A8E)),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
