class GetAllNotificationResponseModel {
  var success;
  var message;
  GetAllNotificationResponse? data;

  GetAllNotificationResponseModel(
      {this.success, this.message, this.data});

  GetAllNotificationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetAllNotificationResponse.fromJson(json['data']) : null;
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

class GetAllNotificationResponse {
  List<GetAllNotification>? data;
  Meta? meta;

  GetAllNotificationResponse({this.data, this.meta});

  GetAllNotificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetAllNotification>[];
      json['data'].forEach((v) {
        data!.add(new GetAllNotification.fromJson(v));
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

class GetAllNotification {
  var sId;
  var receiver;
  var title;
  var body;
  var image;
  var hasRead;
  var createdAt;
  var updatedAt;
  var iV;

  GetAllNotification({
    this.sId,
    this.receiver,
    this.title,
    this.body,
    this.image,
    this.hasRead,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetAllNotification.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    receiver = json['receiver'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    hasRead = json['has_read'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['receiver'] = this.receiver;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['has_read'] = this.hasRead;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Meta {
  int? total;

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
