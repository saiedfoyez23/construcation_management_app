class ImageUploadResponseModel {
  var success;
  var message;
  ImageUploadResponse? data;

  ImageUploadResponseModel({this.success, this.message, this.data});

  ImageUploadResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new ImageUploadResponse.fromJson(json['data']) : null;
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

class ImageUploadResponse {
  var url;

  ImageUploadResponse({this.url});

  ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
