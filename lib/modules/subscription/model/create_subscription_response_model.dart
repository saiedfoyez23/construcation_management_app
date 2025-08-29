class CreateSubscriptionResponseModel {
  var success;
  var message;
  CreateSubscriptionResponse? data;

  CreateSubscriptionResponseModel({this.success, this.message, this.data});

  CreateSubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new CreateSubscriptionResponse.fromJson(json['data']) : null;
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

class CreateSubscriptionResponse {
  String? url;

  CreateSubscriptionResponse({this.url});

  CreateSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
