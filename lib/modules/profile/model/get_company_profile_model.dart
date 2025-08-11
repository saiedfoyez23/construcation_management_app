// class GetCompanyProfileModel {
//   GetCompanyProfileModel({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   final bool? success;
//   final String? message;
//   final Data? data;
//
//   factory GetCompanyProfileModel.fromJson(Map<String, dynamic> json){
//     return GetCompanyProfileModel(
//       success: json["success"],
//       message: json["message"],
//       data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );
//   }
//
// }
//
// class Data {
//   Data({
//     required this.id,
//     required this.email,
//     required this.v,
//     required this.createdAt,
//     required this.isBlocked,
//     required this.isDeleted,
//     required this.password,
//     required this.role,
//     required this.updatedAt,
//     required this.user,
//     required this.userType,
//     required this.isAccountVerified,
//     required this.otpAttempts,
//     required this.otp,
//     required this.otpExpires,
//   });
//
//   final String? id;
//   final String? email;
//   final int? v;
//   final DateTime? createdAt;
//   final bool? isBlocked;
//   final bool? isDeleted;
//   final String? password;
//   final String? role;
//   final DateTime? updatedAt;
//   final String? user;
//   final String? userType;
//   final bool? isAccountVerified;
//   final int? otpAttempts;
//   final String? otp;
//   final DateTime? otpExpires;
//
//   factory Data.fromJson(Map<String, dynamic> json){
//     return Data(
//       id: json["_id"],
//       email: json["email"],
//       v: json["__v"],
//       createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
//       isBlocked: json["is_blocked"],
//       isDeleted: json["is_deleted"],
//       password: json["password"],
//       role: json["role"],
//       updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
//       user: json["user"],
//       userType: json["user_type"],
//       isAccountVerified: json["is_account_verified"],
//       otpAttempts: json["otp_attempts"],
//       otp: json["otp"],
//       otpExpires: DateTime.tryParse(json["otp_expires"] ?? ""),
//     );
//   }
//
// }

///
class GetCompanyProfileModel {
  GetCompanyProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory GetCompanyProfileModel.fromJson(Map<String, dynamic> json){
    return GetCompanyProfileModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.role,
    required this.user,
    required this.userType,
  });

  final String? id;
  final String? role;
  final User? user;
  final String? userType;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      role: json["role"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      userType: json["user_type"],
    );
  }

}

class User {
  User({
    required this.location,
    required this.id,
    required this.email,
    required this.v,
    required this.companyName,
    required this.createdAt,
    required this.name,
    required this.phone,
    required this.updatedAt,
    required this.image,
    required this.logo,
  });

  final dynamic location;
  final String? id;
  final String? email;
  final int? v;
  final String? companyName;
  final DateTime? createdAt;
  final String? name;
  final dynamic phone;
  final DateTime? updatedAt;
  final dynamic image;
  final dynamic logo;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      location: json["location"],
      id: json["_id"],
      email: json["email"],
      v: json["__v"],
      companyName: json["company_name"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      name: json["name"],
      phone: json["phone"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      image: json["image"],
      logo: json["logo"],
    );
  }

}

