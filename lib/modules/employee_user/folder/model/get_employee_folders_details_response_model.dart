class GetEmployeeFoldersDetailsResponseModel {
  var success;
  var message;
  GetEmployeeFoldersDetailsResponse? data;

  GetEmployeeFoldersDetailsResponseModel({this.success, this.message, this.data});

  GetEmployeeFoldersDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetEmployeeFoldersDetailsResponse.fromJson(json['data']) : null;
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

class GetEmployeeFoldersDetailsResponse {
  var sId;
  var name;
  var project;
  var addedBy;
  List<GetEmployeeFoldersDetails>? files;
  var createdAt;
  var updatedAt;
  var iV;

  GetEmployeeFoldersDetailsResponse({
    this.sId,
    this.name,
    this.project,
    this.addedBy,
    this.files,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetEmployeeFoldersDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    project = json['project'];
    addedBy = json['added_by'];
    if (json['files'] != null) {
      files = <GetEmployeeFoldersDetails>[];
      json['files'].forEach((v) {
        files!.add(new GetEmployeeFoldersDetails.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['project'] = this.project;
    data['added_by'] = this.addedBy;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class GetEmployeeFoldersDetails {
  var name;
  var url;
  var sId;

  GetEmployeeFoldersDetails({this.name, this.url, this.sId});

  GetEmployeeFoldersDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}
