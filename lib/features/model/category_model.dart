class CategoryModel {
  final bool status;
  final List<CategoryData>? data;

  CategoryModel({
    required this.status,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      status: json['status'],
      data: json['data'] != null
          ? List<CategoryData>.from(
              json['data'].map((x) => CategoryData.fromJson(x)),
            )
          : null, // Set data to null if 'data' key is null
    );
  }
}

class CategoryData {
  final String id;
  final String title;
  final String image;

  CategoryData({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
