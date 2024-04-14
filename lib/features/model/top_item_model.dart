class TopItemModel {
  final bool status;
  final int length;
  final List<TopItemData> data;

  TopItemModel({
    required this.status,
    required this.length,
    required this.data,
  });

  factory TopItemModel.fromJson(Map<String, dynamic> json) {
    return TopItemModel(
      status: json['status'],
      length: json['length'],
      data: List<TopItemData>.from(
          json['data'].map((x) => TopItemData.fromJson(x))),
    );
  }
}

class TopItemData {
  final String id;
  final String name;
  final String description;
  final TopCategoryData category;
  final String backGroundImage;

  TopItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.backGroundImage,
  });

  factory TopItemData.fromJson(Map<String, dynamic> json) {
    return TopItemData(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      category: TopCategoryData.fromJson(json['category']),
      backGroundImage: json['backGroundImage'],
    );
  }
}

class TopCategoryData {
  final String id;
  final String title;

  TopCategoryData({
    required this.id,
    required this.title,
  });

  factory TopCategoryData.fromJson(Map<String, dynamic> json) {
    return TopCategoryData(
      id: json['_id'],
      title: json['title'],
    );
  }
}
