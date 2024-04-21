import 'package:dalily/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class RowTextComponent extends StatelessWidget {
  final String text;
  final String text1;
  final void Function()? onClick;
  const RowTextComponent({
    Key? key,
    required this.text,
    required this.text1,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.largeTitle22,
          ),
        ),
        TextButton(
          onPressed: onClick,
          child: Text(
            text1,
            style: AppTextStyles.mediumTitle17,
          ),
        ),
      ],
    );
  }
}
