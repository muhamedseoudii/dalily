import 'package:dalily/mvc/model/specific_item_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecificItemController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isLoadingReview = true.obs;
  Rx<SpecificItemData?> specificItemData = Rx<SpecificItemData?>(null);
  RxBool isError = false.obs;
  RxBool isErrorReview = false.obs;

  Future<void> fetchSpecificItem(String itemId) async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      final response = await dio.get(
        "https://dalilalhafr.com/api/items/getSpecificItem",
        data: {"itemId": itemId},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (kDebugMode) {
        print(response.data);
      } // Print API response for debugging
      var specificItemModel = SpecificItemModel.fromJson(response.data);
      specificItemData(specificItemModel.data);
      if (kDebugMode) {
        print(specificItemModel);
      } // Print parsed CategoryModel for debugging
      isError(false);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      } // Print error for debugging
      isError(true);
    } finally {
      isLoading(false);
    }
  }

  Future<bool> sendItemReview(
      String itemId, String review, double rating) async {
    print('i executed');
    try {
      isLoadingReview(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      final response = await dio.post(
        "https://dalilalhafr.com/api/reviews/addReview",
        data: {"review": review, "item": itemId, "rating": rating},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if (kDebugMode) {
        print(response.data);
      } // Print API response for debugging

      var data = response.data;
      if (data != null) {
        isErrorReview(false);
        return true;
      } else {
        isErrorReview(true);
        return false;
      }
    } catch (error, st) {
      isErrorReview(true);
      return false;
    } finally {
      isLoadingReview(false);
    }
  }
}
