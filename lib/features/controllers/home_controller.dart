import 'package:dalily/features/model/category_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<CategoryData> categories = <CategoryData>[].obs;
  RxBool isError = false.obs;

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      final response = await dio.get(
        "https://dalilalhafr.com/api/cats/getCats",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      // print(response.data); // Print API response for debugging
      var categoryModel = CategoryModel.fromJson(response.data);
      categories(categoryModel.data);
      print(categoryModel); // Print parsed CategoryModel for debugging
      isError(false);
    } catch (error) {
      print(error); // Print error for debugging
      isError(true);
    } finally {
      isLoading(false);
    }
  }
}
