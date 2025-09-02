class GetSingleEmployeeResponseModel {
  var success;
  var message;
  GetSingleEmployeeResponse? data;

  GetSingleEmployeeResponseModel({this.success, this.message, this.data});

  GetSingleEmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetSingleEmployeeResponse.fromJson(json['data']) : null;
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

class GetSingleEmployeeResponse {
  var sId;
  var type;
  var name;
  var employeeId;
  var image;
  var email;
  var phone;
  var companyAdmin;
  var iV;

  GetSingleEmployeeResponse({
    this.sId,
    this.type,
    this.name,
    this.employeeId,
    this.image,
    this.email,
    this.phone,
    this.companyAdmin,
    this.iV,
  });

  GetSingleEmployeeResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    employeeId = json['employee_id'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    companyAdmin = json['company_admin'];
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
    data['company_admin'] = this.companyAdmin;
    data['__v'] = this.iV;
    return data;
  }
}
