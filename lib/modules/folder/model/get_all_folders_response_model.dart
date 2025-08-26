class GetAllFoldersResponseModel {
  var success;
  var message;
  List<GetAllFoldersResponse>? data;

  GetAllFoldersResponseModel({this.success, this.message, this.data});

  GetAllFoldersResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllFoldersResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllFoldersResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllFoldersResponse {
  var sId;
  var name;
  var files;

  GetAllFoldersResponse({this.sId, this.name, this.files});

  GetAllFoldersResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['files'] = this.files;
    return data;
  }
}
