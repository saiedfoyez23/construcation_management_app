class GetFoldersDetailsResponseModel {
  var success;
  var message;
  GetFoldersDetailsResponse? data;

  GetFoldersDetailsResponseModel({this.success, this.message, this.data});

  GetFoldersDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetFoldersDetailsResponse.fromJson(json['data']) : null;
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

class GetFoldersDetailsResponse {
  var sId;
  var name;
  var project;
  var addedBy;
  List<GetFoldersDetails>? files;
  var createdAt;
  var updatedAt;
  var iV;

  GetFoldersDetailsResponse({
    this.sId,
    this.name,
    this.project,
    this.addedBy,
    this.files,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetFoldersDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    project = json['project'];
    addedBy = json['added_by'];
    if (json['files'] != null) {
      files = <GetFoldersDetails>[];
      json['files'].forEach((v) {
        files!.add(new GetFoldersDetails.fromJson(v));
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

class GetFoldersDetails {
  var name;
  var url;
  var sId;

  GetFoldersDetails({this.name, this.url, this.sId});

  GetFoldersDetails.fromJson(Map<String, dynamic> json) {
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
