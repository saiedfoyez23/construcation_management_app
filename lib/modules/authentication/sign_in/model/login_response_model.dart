class LoginResponseModel {
  var success;
  var message;
  LoginResponse? data;

  LoginResponseModel({this.success, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new LoginResponse.fromJson(json['data']) : null;
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

class LoginResponse {
  var accessToken;

  LoginResponse({this.accessToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    return data;
  }
}
