class GetEmployeeAllWorkforcesResponseModel {
  var success;
  var message;
  List<GetEmployeeAllWorkforcesResponse>? data;

  GetEmployeeAllWorkforcesResponseModel({this.success, this.message, this.data});

  GetEmployeeAllWorkforcesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetEmployeeAllWorkforcesResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetEmployeeAllWorkforcesResponse.fromJson(v));
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

class GetEmployeeAllWorkforcesResponse {
  var sId;
  var project;
  var name;
  var quantity;
  var initialQuantity;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  GetEmployeeAllWorkforcesResponse({
    this.sId,
    this.project,
    this.name,
    this.quantity,
    this.initialQuantity,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetEmployeeAllWorkforcesResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    name = json['name'];
    quantity = json['quantity'];
    initialQuantity = json['initial_quantity'];
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
    data['initial_quantity'] = this.initialQuantity;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
