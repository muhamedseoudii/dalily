class SpecificItemModel {
  final bool status;
  final SpecificItemData data;

  SpecificItemModel({required this.status, required this.data});

  factory SpecificItemModel.fromJson(Map<String, dynamic> json) {
    return SpecificItemModel(
      status: json['status'],
      data: SpecificItemData.fromJson(json['data']),
    );
  }
}

class SpecificItemData {
  final String id;
  final String name;
  final String description;
  final SpecificItemCategoryData category;
  final double ratingsAverage;
  final int ratingsQuantity;
  final List<String> images;
  final String about;
  final String backGroundImage;
  final List<Review> reviews;

  SpecificItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.images,
    required this.about,
    required this.backGroundImage,
    required this.reviews,
  });

  factory SpecificItemData.fromJson(Map<String, dynamic> json) {
    return SpecificItemData(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      category: SpecificItemCategoryData.fromJson(json['category']),
      ratingsAverage: json['ratingsAverage'].toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      images: List<String>.from(json['images'].map((x) => x)),
      about: json['About'],
      backGroundImage: json['backGroundImage'],
      reviews:
          List<Review>.from(json['reviews'].map((x) => Review.fromJson(x))),
    );
  }
}

class SpecificItemCategoryData {
  final String id;
  final String title;

  SpecificItemCategoryData({required this.id, required this.title});

  factory SpecificItemCategoryData.fromJson(Map<String, dynamic> json) {
    return SpecificItemCategoryData(
      id: json['_id'],
      title: json['title'],
    );
  }
}

class Review {
  final String id;
  final String review;
  final UserData user;
  final String item;
  final int rating;
  final String createdAt;

  Review({
    required this.id,
    required this.review,
    required this.user,
    required this.item,
    required this.rating,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'],
      review: json['review'],
      user: UserData.fromJson(json['user']),
      item: json['item'],
      rating: json['rating'],
      createdAt: json['createdAt'],
    );
  }
}

class UserData {
  final String id;
  final String name;
  final String profileImage;

  UserData({required this.id, required this.name, required this.profileImage});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      name: json['name'],
      profileImage: json['profileImage'],
    );
  }
}
