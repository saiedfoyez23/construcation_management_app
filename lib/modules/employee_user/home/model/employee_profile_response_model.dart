class EmployeeProfileResponseModel {
  var success;
  var message;
  EmployeeProfileResponse? data;

  EmployeeProfileResponseModel({this.success, this.message, this.data});

  EmployeeProfileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new EmployeeProfileResponse.fromJson(json['data']) : null;
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

class EmployeeProfileResponse {
  var sId;
  var type;
  var name;
  var employeeId;
  var image;
  var email;
  var phone;
  CompanyAdmin? companyAdmin;
  var isDeleted;
  var location;
  var iV;

  EmployeeProfileResponse({
    this.sId,
    this.type,
    this.name,
    this.employeeId,
    this.image,
    this.email,
    this.phone,
    this.companyAdmin,
    this.isDeleted,
    this.location,
    this.iV,
  });

  EmployeeProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    employeeId = json['employee_id'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    companyAdmin = json['company_admin'] != null
        ? new CompanyAdmin.fromJson(json['company_admin'])
        : null;
    isDeleted = json['is_deleted'];
    location = json['location'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['employee_id'] = this.employeeId;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.companyAdmin != null) {
      data['company_admin'] = this.companyAdmin!.toJson();
    }
    data['location'] = this.location;
    data['is_deleted'] = this.isDeleted;
    data['__v'] = this.iV;
    return data;
  }
}

class CompanyAdmin {
  var sId;
  var email;
  var iV;
  var createdAt;
  var isBlocked;
  var isDeleted;
  var password;
  var role;
  var updatedAt;
  var user;
  var userType;
  var isAccountVerified;

  CompanyAdmin({
    this.sId,
    this.email,
    this.iV,
    this.createdAt,
    this.isBlocked,
    this.isDeleted,
    this.password,
    this.role,
    this.updatedAt,
    this.user,
    this.userType,
    this.isAccountVerified,
  });

  CompanyAdmin.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    isBlocked = json['is_blocked'];
    isDeleted = json['is_deleted'];
    password = json['password'];
    role = json['role'];
    updatedAt = json['updatedAt'];
    user = json['user'];
    userType = json['user_type'];
    isAccountVerified = json['is_account_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['is_blocked'] = this.isBlocked;
    data['is_deleted'] = this.isDeleted;
    data['password'] = this.password;
    data['role'] = this.role;
    data['updatedAt'] = this.updatedAt;
    data['user'] = this.user;
    data['user_type'] = this.userType;
    data['is_account_verified'] = this.isAccountVerified;
    return data;
  }
}
