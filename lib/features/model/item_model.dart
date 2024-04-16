class ItemModel {
  final bool status;
  final int length;
  final List<ItemData> data;

  ItemModel({
    required this.status,
    required this.length,
    required this.data,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      status: json['status'],
      length: json['length'],
      data: List<ItemData>.from(json['data'].map((x) => ItemData.fromJson(x))),
    );
  }
}

class ItemData {
  final String id;
  final String name;
  final String description;
  final CategoryItemData category;
  final double ratingsAverage;
  final int ratingsQuantity;
  final String backGroundImage;

  ItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.backGroundImage,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      category: CategoryItemData.fromJson(json['category'][0]),
      ratingsAverage: json['ratingsAverage'].toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      backGroundImage: json['backGroundImage'] ??
          'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png',
    );
  }
}

class CategoryItemData {
  final String id;
  final String title;

  CategoryItemData({
    required this.id,
    required this.title,
  });

  factory CategoryItemData.fromJson(Map<String, dynamic> json) {
    return CategoryItemData(
      id: json['_id'],
      title: json['title'],
    );
  }
}
