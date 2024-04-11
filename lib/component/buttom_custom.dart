import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledButtomEdit extends StatelessWidget {
  final String text;
  final Color color, color1;
  final double size;
  final FocusNode? focusNodes;
  final void Function()? onClick;
  const FilledButtomEdit(
      {Key? key,
      required this.text,
      required this.color,
      required this.size,
      required this.color1,
      required this.onClick,
      this.focusNodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        focusNode: focusNodes,
        onPressed: onClick,
        style: FilledButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(330.w, 50.h),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color1,
              fontSize: size.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
