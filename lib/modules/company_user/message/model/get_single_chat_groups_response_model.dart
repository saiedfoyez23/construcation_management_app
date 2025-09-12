class GetSingleChatGroupsResponseModel {
  var success;
  var message;
  GetSingleChatGroupsResponse? data;

  GetSingleChatGroupsResponseModel({this.success, this.message, this.data});

  GetSingleChatGroupsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetSingleChatGroupsResponse.fromJson(json['data']) : null;
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

class GetSingleChatGroupsResponse {
  var sId;
  Project? project;
  List<Participants>? participants;
  LastMessage? lastMessage;
  var createdAt;
  var updatedAt;
  var iV;

  GetSingleChatGroupsResponse({
    this.sId,
    this.project,
    this.participants,
    this.lastMessage,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetSingleChatGroupsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(new Participants.fromJson(v));
      });
    }
    lastMessage = json['last_message'] != null
        ? new LastMessage.fromJson(json['last_message'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    if (this.lastMessage != null) {
      data['last_message'] = this.lastMessage!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Project {
  var sId;
  var name;

  Project({this.sId, this.name});

  Project.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Participants {
  var sId;
  var email;

  Participants({this.sId, this.email});

  Participants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    return data;
  }
}

class LastMessage {
  var sId;
  var sender;
  var content;
  var createdAt;

  LastMessage({this.sId, this.sender, this.content, this.createdAt});

  LastMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender = json['sender'];
    content = json['content'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sender'] = this.sender;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
