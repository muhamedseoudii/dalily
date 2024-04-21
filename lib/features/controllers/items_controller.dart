import 'package:dalily/features/model/item_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class ItemController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ItemData> items = <ItemData>[].obs;
  RxBool isError = false.obs;

  Future<void> fetchItems() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      final response = await dio.get(
        "https://dalilalhafr.com/api/items/getItems",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      var data = response.data;
      if (data != null) {
        items.value = List<ItemData>.from(
          data['data'].map((item) => ItemData.fromJson(item)),
        );
        isError(false);
      } else {
        isError(true);
      }
    } catch (error) {
      isError(true);
    } finally {
      isLoading(false);
    }
  }
}
