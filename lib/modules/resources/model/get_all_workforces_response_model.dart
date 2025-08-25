class GetAllWorkforcesResponseModel {
  var success;
  var message;
  List<GetAllWorkforcesResponse>? data;

  GetAllWorkforcesResponseModel({this.success, this.message, this.data});

  GetAllWorkforcesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllWorkforcesResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllWorkforcesResponse.fromJson(v));
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

class GetAllWorkforcesResponse {
  var sId;
  var project;
  var name;
  var quantity;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  GetAllWorkforcesResponse({
    this.sId,
    this.project,
    this.name,
    this.quantity,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetAllWorkforcesResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    name = json['name'];
    quantity = json['quantity'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['project'] = this.project;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
