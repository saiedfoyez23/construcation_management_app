class GetAllMessageResponseModel {
  var success;
  var message;
  GetAllMessageResponse? data;

  GetAllMessageResponseModel({this.success, this.message, this.data});

  GetAllMessageResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetAllMessageResponse.fromJson(json['data']) : null;
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

class GetAllMessageResponse {
  List<GetAllMessage>? data;
  Meta? meta;

  GetAllMessageResponse({this.data, this.meta});

  GetAllMessageResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetAllMessage>[];
      json['data'].forEach((v) {
        data!.add(new GetAllMessage.fromJson(v));
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

class GetAllMessage {
  var sId;
  var chatGroup;
  Sender? sender;
  var content;
  var createdAt;
  var updatedAt;
  var iV;

  GetAllMessage({
    this.sId,
    this.chatGroup,
    this.sender,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetAllMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    chatGroup = json['chat_group'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['chat_group'] = this.chatGroup;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Sender {
  var sId;
  User? user;
  var userType;

  Sender({this.sId, this.user, this.userType});

  Sender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_type'] = this.userType;
    return data;
  }
}

class User {
  var sId;
  var name;
  var image;

  User({this.sId, this.name, this.image});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
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
