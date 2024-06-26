import 'package:dalily/features/controllers/login_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TextFieldEdit extends StatelessWidget {
  final String? labelText, hintText;
  final String image;
  final TextEditingController controller;
  final String validateText;
  final Widget? icon;
  final TextStyle? style;

  const TextFieldEdit(
      {Key? key,
      this.labelText,
      required this.image,
      required this.controller,
      required this.validateText,
      this.icon,
      this.hintText,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginController controller = Get.find();
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: style,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        prefixIcon: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        suffixIcon: icon,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validateText;
        }
        return null;
      },
    );
  }
}

class TextFieldEdit2 extends StatelessWidget {
  final String text;
  final String image;
  final TextEditingController controller;
  final TextStyle? style;

  const TextFieldEdit2(
      {Key? key,
      required this.text,
      required this.image,
      required this.controller,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginController controller = Get.find();
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      style: style,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        prefixIcon: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your Name';
        }
        return null;
      },
    );
  }
}

class TextFieldEdit1 extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onClick;
  final TextEditingController controller1;
  final TextStyle? style;

  const TextFieldEdit1(
      {Key? key,
      required this.text,
      required this.image,
      required this.onClick,
      required this.controller1,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return TextFormField(
      controller: controller1,
      keyboardType: TextInputType.visiblePassword,
      style: style,
      // cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        // filled: true,
        // fillColor: const Color(0xffFFFFFF),
        prefixIcon: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        suffixIcon: IconButton(
          icon: Icon(controller.obscureT
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
          onPressed: onClick,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
        ),
      ),
      obscureText: controller.obscureT,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter a password';
        } else if ((value?.length ?? 0) < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}

class TextFieldEdit4 extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onClick;
  final TextEditingController controller1;
  final Widget icon;
  final bool obscureText;
  final TextStyle? style;

  const TextFieldEdit4(
      {Key? key,
      required this.text,
      required this.image,
      required this.onClick,
      required this.controller1,
      required this.icon,
      required this.obscureText,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      keyboardType: TextInputType.visiblePassword,
      style: style,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        prefixIcon: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        suffixIcon: IconButton(
          icon: icon,
          onPressed: onClick,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter a password';
        } else if ((value?.length ?? 0) < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}

class TextFieldEdit3 extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onClick;
  final TextEditingController controller3;
  final Widget icon;
  final bool obscureText;
  final TextEditingController controller4;
  final TextStyle? style;

  const TextFieldEdit3(
      {Key? key,
      required this.text,
      required this.image,
      required this.onClick,
      required this.controller3,
      required this.icon,
      required this.obscureText,
      required this.controller4,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller3,
      keyboardType: TextInputType.visiblePassword,
      style: style,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        prefixIcon: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        suffixIcon: IconButton(
          icon: icon,
          onPressed: onClick,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter a password';
        } else if ((value?.length ?? 0) < 6) {
          return 'Password must be at least 6 characters';
        } else if (value != controller4.text) {
          return 'Both password must match';
        }
        return null;
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  final String text;
  final String image;
  final TextEditingController controller;
  final String hintText;
  final void Function()? onClick;
  final void Function(String)? onChanged;

  const SearchTextField(
      {Key? key,
      required this.text,
      required this.image,
      required this.hintText,
      this.onClick,
      required this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        prefixIcon: SvgPicture.asset(image, fit: BoxFit.scaleDown),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: onClick,
        ),
        filled: true,
        fillColor: const Color(0xffF5F5F5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xffFF472B), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffF5F5F5)),
        ),
      ),
    );
  }
}

class CommentTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const CommentTextField(
      {Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff9CA3AF),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: 1,
        filled: true,
        fillColor: const Color(0xffF5F5F5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(color: const Color(0xff79A3D3), width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffE0E0E0)),
        ),
      ),
    );
  }
}
