class ProfileResponseModel {
  var success;
  var message;
  ProfileResponse? data;

  ProfileResponseModel({this.success, this.message, this.data});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new ProfileResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileResponse {
  var sId;
  var role;
  User? user;
  var userType;

  ProfileResponse({this.sId, this.role, this.user, this.userType});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['role'] = this.role;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_type'] = this.userType;
    return data;
  }
}

class User {
  var sId;
  var email;
  var iV;
  var companyName;
  var createdAt;
  var location;
  var logo;
  var image;
  var name;
  var phone;
  var updatedAt;

  User({
    this.sId,
    this.email,
    this.iV,
    this.companyName,
    this.createdAt,
    this.location,
    this.image,
    this.logo,
    this.name,
    this.phone,
    this.updatedAt
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    iV = json['__v'];
    companyName = json['company_name'];
    createdAt = json['createdAt'];
    location = json['location'];
    image = json['image'];
    logo = json['logo'];
    name = json['name'];
    phone = json['phone'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['__v'] = this.iV;
    data['company_name'] = this.companyName;
    data['createdAt'] = this.createdAt;
    data['location'] = this.location;
    data['image'] = this.image;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
