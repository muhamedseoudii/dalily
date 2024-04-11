import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController {
  final formKey4 = GlobalKey<FormState>();
  bool obscureT = true;
  bool obscureT1 = true;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  toggleDesign() {
    obscureT = !obscureT;
    update();
  }

  toggleDesign1() {
    obscureT1 = !obscureT1;
    update();
  }
}
