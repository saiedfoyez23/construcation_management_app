class GetAllCompanyEmployeeResponseModel {
  var success;
  var message;
  GetAllCompanyEmployeeResponse? data;

  GetAllCompanyEmployeeResponseModel({this.success, this.message, this.data});

  GetAllCompanyEmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetAllCompanyEmployeeResponse.fromJson(json['data']) : null;
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

class GetAllCompanyEmployeeResponse {
  List<GetAllCompanyEmployee>? data;
  Meta? meta;

  GetAllCompanyEmployeeResponse({this.data, this.meta});

  GetAllCompanyEmployeeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetAllCompanyEmployee>[];
      json['data'].forEach((v) {
        data!.add(new GetAllCompanyEmployee.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class GetAllCompanyEmployee {
  var image;
  var sId;
  var type;
  var name;
  var employeeId;
  var email;
  var phone;
  var companyAdmin;
  var iV;

  GetAllCompanyEmployee({
    this.image,
    this.sId,
    this.type,
    this.name,
    this.employeeId,
    this.email,
    this.phone,
    this.companyAdmin,
    this.iV,
  });

  GetAllCompanyEmployee.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    employeeId = json['employee_id'];
    email = json['email'];
    phone = json['phone'];
    companyAdmin = json['company_admin'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['employee_id'] = this.employeeId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['company_admin'] = this.companyAdmin;
    data['__v'] = this.iV;
    return data;
  }
}

class Meta {
  var total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
