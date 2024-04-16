import 'package:dalily/features/model/search_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchItemController extends GetxController {
  RxList<SearchData> search = <SearchData>[].obs;

  void fetchSearchResults(String query) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      Dio dio = Dio();
      var response = await dio.get(
        'https://dalilalhafr.com/api/items/search',
        data: {'word': query},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      print(response.data);
      if (response.statusCode == 200) {
        var data = response.data;
        if (data != null && data['data'] != null) {
          search.value = List<SearchData>.from(
            data['data'].map((item) => SearchData.fromJson(item)),
          );
          print("data");
          print(search);
        } else {
          print('Data or data["data"] is null.');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
    } catch (e) {
      print('Exception: $e');
    }
  }
}
