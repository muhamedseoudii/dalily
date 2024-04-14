class ProfileModel {
  final bool status;
  final ProfileData data;

  ProfileModel({
    required this.status,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'] ?? false,
      data: ProfileData.fromJson(json['data'] ?? {}),
    );
  }
}

class ProfileData {
  final String id;
  final String name;
  final String email;
  final String role;
  final String profileImage;
  final bool isActive;
  final int v;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.profileImage,
    required this.isActive,
    required this.v,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      profileImage: json['profileImage'] ?? '',
      isActive: json['isActive'] ?? false,
      v: json['__v'] ?? 0,
    );
  }
}
