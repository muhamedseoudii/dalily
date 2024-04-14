class ReviewModel {
  final bool status;
  final String message;
  final int length;
  final List<ReviewData> data;

  ReviewModel({
    required this.status,
    required this.message,
    required this.length,
    required this.data,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      length: json['length'] ?? 0,
      data: List<ReviewData>.from(
        json['data'].map((x) => ReviewData.fromJson(x)),
      ),
    );
  }
}

class ReviewData {
  final String id;
  final String review;
  final ReviewUserData user;
  final String item;
  final double rating;
  final String createdAt;

  ReviewData({
    required this.id,
    required this.review,
    required this.user,
    required this.item,
    required this.rating,
    required this.createdAt,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      id: json['_id'] ?? '',
      review: json['review'] ?? '',
      user: ReviewUserData.fromJson(json['user'] ?? {}),
      item: json['item'] ?? '',
      rating: json['rating'].toDouble(),
      createdAt: json['createdAt'] ?? '',
    );
  }
}

class ReviewUserData {
  final String id;
  final String name;
  final String profileImage;

  ReviewUserData({
    required this.id,
    required this.name,
    required this.profileImage,
  });

  factory ReviewUserData.fromJson(Map<String, dynamic> json) {
    return ReviewUserData(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}
