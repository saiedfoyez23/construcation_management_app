class GetEmployeeAllSiteDiariesResponseModel {
  var success;
  var message;
  GetEmployeeAllSiteDiariesResponse? data;

  GetEmployeeAllSiteDiariesResponseModel({this.success, this.message, this.data});

  GetEmployeeAllSiteDiariesResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetEmployeeAllSiteDiariesResponse.fromJson(json['data']) : null;
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

class GetEmployeeAllSiteDiariesResponse {
  List<GetEmployeeAllSiteDiaries>? data;
  Meta? meta;

  GetEmployeeAllSiteDiariesResponse({this.data, this.meta});

  GetEmployeeAllSiteDiariesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetEmployeeAllSiteDiaries>[];
      json['data'].forEach((v) {
        data!.add(new GetEmployeeAllSiteDiaries.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class GetEmployeeAllSiteDiaries {
  var sId;
  var name;
  var duration;
  var location;
  var createdAt;
  var totalWorkforces;
  var totalEquipments;

  GetEmployeeAllSiteDiaries({
    this.sId,
    this.name,
    this.duration,
    this.location,
    this.createdAt,
    this.totalWorkforces,
    this.totalEquipments,
  });

  GetEmployeeAllSiteDiaries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    duration = json['duration'];
    location = json['location'];
    createdAt = json['createdAt'];
    totalWorkforces = json['totalWorkforces'];
    totalEquipments = json['totalEquipments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['totalWorkforces'] = this.totalWorkforces;
    data['totalEquipments'] = this.totalEquipments;
    return data;
  }
}

class Meta {
  var total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
