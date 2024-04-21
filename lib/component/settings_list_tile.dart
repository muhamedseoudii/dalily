import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsListTile extends StatelessWidget {
  final String text;
  final String image;
  final Widget? widget;
  final void Function()? onTap;
  final ColorFilter? colorFilter;

  const SettingsListTile({
    Key? key,
    required this.text,
    required this.image,
    this.widget,
    this.onTap,
    this.colorFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 55.h,
          width: 400.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.fromBorderSide(BorderSide(color: Colors.red)),
          ),
          child: ListTile(
            title: Text(
              text,
              style: AppTextStyles.largeTitle16,
            ),
            leading: SvgPicture.asset("assets/icons/$image.svg",
                colorFilter: colorFilter),
            trailing: widget,
          ),
        ),
      ),
    );
  }
}
