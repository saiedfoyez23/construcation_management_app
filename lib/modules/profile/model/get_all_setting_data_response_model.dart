class GetAllSettingDataResponseModel {
  var success;
  var message;
  GetAllSettingDataResponse? data;

  GetAllSettingDataResponseModel({this.success, this.message, this.data});

  GetAllSettingDataResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetAllSettingDataResponse.fromJson(json['data']) : null;
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

class GetAllSettingDataResponse {
  var sId;
  var iV;
  var aboutUs;
  var createdAt;
  var privacyPolicy;
  var termsConditions;
  var updatedAt;

  GetAllSettingDataResponse({
    this.sId,
    this.iV,
    this.aboutUs,
    this.createdAt,
    this.privacyPolicy,
    this.termsConditions,
    this.updatedAt
  });

  GetAllSettingDataResponse.fromJson(Map<String, dynamic> json) {
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
