class GetEmployeeAllFoldersResponseModel {
  var success;
  var message;
  List<GetEmployeeAllFoldersResponse>? data;

  GetEmployeeAllFoldersResponseModel({this.success, this.message, this.data});

  GetEmployeeAllFoldersResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetEmployeeAllFoldersResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetEmployeeAllFoldersResponse.fromJson(v));
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

class GetEmployeeAllFoldersResponse {
  var sId;
  var name;
  var files;

  GetEmployeeAllFoldersResponse({this.sId, this.name, this.files});

  GetEmployeeAllFoldersResponse.fromJson(Map<String, dynamic> json) {
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
