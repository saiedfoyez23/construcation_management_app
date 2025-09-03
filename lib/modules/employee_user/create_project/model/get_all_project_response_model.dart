class EmployeeGetAllProjectResponseModel {
  var success;
  var message;
  EmployeeGetAllProjectResponse? data;

  EmployeeGetAllProjectResponseModel({this.success, this.message, this.data});

  EmployeeGetAllProjectResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new EmployeeGetAllProjectResponse.fromJson(json['data']) : null;
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

class EmployeeGetAllProjectResponse {
  List<EmployeeGetAllProject>? data;
  Meta? meta;

  EmployeeGetAllProjectResponse({this.data, this.meta});

  EmployeeGetAllProjectResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EmployeeGetAllProject>[];
      json['data'].forEach((v) {
        data!.add(new EmployeeGetAllProject.fromJson(v));
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

class EmployeeGetAllProject {
  var sId;
  var companyAdmin;
  var name;
  var location;
  var createdAt;
  var updatedAt;
  var totalDayWork;
  var totalSiteDiary;
  List<String>? dayWorkImages;

  EmployeeGetAllProject({
    this.sId,
    this.companyAdmin,
    this.name,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.totalDayWork,
    this.totalSiteDiary,
    this.dayWorkImages,
  });

  EmployeeGetAllProject.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyAdmin = json['company_admin'];
    name = json['name'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalDayWork = json['totalDayWork'];
    totalSiteDiary = json['totalSiteDiary'];
    dayWorkImages = json['dayWorkImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['company_admin'] = this.companyAdmin;
    data['name'] = this.name;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['totalDayWork'] = this.totalDayWork;
    data['totalSiteDiary'] = this.totalSiteDiary;
    data['dayWorkImages'] = this.dayWorkImages;
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
