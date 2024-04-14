import 'package:dalily/features/model/item_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryItemController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ItemData> categories = <ItemData>[].obs;
  RxBool isError = false.obs;

  Future<void> fetchItemCategories(String title) async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      final response = await dio.get(
        "https://dalilalhafr.com/api/items/getItems",
        data: {"title": title},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      print(response.data); // Print API response for debugging
      var itemModel = ItemModel.fromJson(response.data);
      categories(itemModel.data);
      print(itemModel); // Print parsed CategoryModel for debugging
      isError(false);
    } catch (error) {
      print(error); // Print error for debugging
      isError(true);
    } finally {
      isLoading(false);
    }
  }
}
