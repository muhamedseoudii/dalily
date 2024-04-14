class SearchModel {
  final bool status;
  final List<SearchData> data;

  SearchModel({required this.status, required this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      status: json['status'],
      data: List<SearchData>.from(
          json['data'].map((x) => SearchData.fromJson(x))),
    );
  }
}

class SearchData {
  final String id;
  final String name;
  final String description;
  final SearchCategory category;
  final double ratingsAverage;
  final int ratingsQuantity;
  final List<String> images;
  final String about;
  final int v;
  final String backgroundImage;

  SearchData({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.images,
    required this.about,
    required this.v,
    required this.backgroundImage,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: SearchCategory.fromJson(json['category']),
      ratingsAverage: json['ratingsAverage'].toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      images: List<String>.from(json['images'].map((x) => x)),
      about: json['About'] as String,
      v: json['__v'],
      backgroundImage: json['backGroundImage'] as String,
    );
  }
}

class SearchCategory {
  final String id;
  final String title;

  SearchCategory({required this.id, required this.title});

  factory SearchCategory.fromJson(Map<String, dynamic> json) {
    return SearchCategory(
      id: json['_id'],
      title: json['title'],
    );
  }
}
