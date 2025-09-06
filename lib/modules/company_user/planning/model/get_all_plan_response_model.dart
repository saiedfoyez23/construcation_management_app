class GetAllPlanResponseModel {
  var success;
  var message;
  GetAllPlanResponse? data;

  GetAllPlanResponseModel({this.success, this.message, this.data});

  GetAllPlanResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetAllPlanResponse.fromJson(json['data']) : null;
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

class GetAllPlanResponse {
  List<GetAllPlan>? data;
  Meta? meta;

  GetAllPlanResponse({this.data, this.meta});

  GetAllPlanResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetAllPlan>[];
      json['data'].forEach((v) {
        data!.add(new GetAllPlan.fromJson(v));
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

class GetAllPlan {
  var sId;
  var name;
  var dueDate;
  var dueTime;
  var totalWorkforces;
  var totalEquipments;

  GetAllPlan({
    this.sId,
    this.name,
    this.dueDate,
    this.dueTime,
    this.totalWorkforces,
    this.totalEquipments,
  });

  GetAllPlan.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    dueDate = json['due_date'];
    dueTime = json['due_time'];
    totalWorkforces = json['totalWorkforces'];
    totalEquipments = json['totalEquipments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['due_date'] = this.dueDate;
    data['due_time'] = this.dueTime;
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
