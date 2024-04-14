import 'package:dalily/features/model/review_model.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewsController extends GetxController {
  RxList<ReviewData> reviews = <ReviewData>[].obs;

  void fetchReviews(String itemId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      var response = await dio.get(
        'https://dalilalhafr.com/api/reviews/getReviews',
        data: {"itemId": itemId},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data != null) {
          reviews.value = List<ReviewData>.from(
            data['data'].map((item) => ReviewData.fromJson(item)),
          );
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
    } catch (e) {
      print('Exception: $e');
    }
  }
}
