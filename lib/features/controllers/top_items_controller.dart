import 'package:dalily/features/model/top_item_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopItemController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<TopItemData> items = <TopItemData>[].obs;
  RxBool isError = false.obs;

  Future<void> fetchItems() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      final response = await dio.get(
        "https://dalilalhafr.com/api/items/top-5",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      var data = response.data;
      if (data != null) {
        items.value = List<TopItemData>.from(
          data['data'].map((item) => TopItemData.fromJson(item)),
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
