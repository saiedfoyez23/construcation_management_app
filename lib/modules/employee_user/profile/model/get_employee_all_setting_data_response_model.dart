class GetEmployeeAllSettingDataResponseModel {
  var success;
  var message;
  GetEmployeeAllSettingDataResponse? data;

  GetEmployeeAllSettingDataResponseModel({this.success, this.message, this.data});

  GetEmployeeAllSettingDataResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetEmployeeAllSettingDataResponse.fromJson(json['data']) : null;
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

class GetEmployeeAllSettingDataResponse {
  var sId;
  var iV;
  var aboutUs;
  var createdAt;
  var privacyPolicy;
  var termsConditions;
  var updatedAt;

  GetEmployeeAllSettingDataResponse({
    this.sId,
    this.iV,
    this.aboutUs,
    this.createdAt,
    this.privacyPolicy,
    this.termsConditions,
    this.updatedAt
  });

  GetEmployeeAllSettingDataResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    iV = json['__v'];
    aboutUs = json['about_us'];
    createdAt = json['createdAt'];
    privacyPolicy = json['privacy_policy'];
    termsConditions = json['terms_conditions'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    data['about_us'] = this.aboutUs;
    data['createdAt'] = this.createdAt;
    data['privacy_policy'] = this.privacyPolicy;
    data['terms_conditions'] = this.termsConditions;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
