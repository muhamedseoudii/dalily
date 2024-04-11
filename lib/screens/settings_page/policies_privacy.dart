import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliciesPrivacyView extends StatelessWidget {
  const PoliciesPrivacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Policies & Privacy".tr)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("text".tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
