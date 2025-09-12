class GetMyChatGroupsResponseModel {
  var success;
  var message;
  GetMyChatGroupsResponse? data;

  GetMyChatGroupsResponseModel({this.success, this.message, this.data});

  GetMyChatGroupsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetMyChatGroupsResponse.fromJson(json['data']) : null;
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

class GetMyChatGroupsResponse {
  List<GetMyChatGroups>? data;
  Meta? meta;

  GetMyChatGroupsResponse({this.data, this.meta});

  GetMyChatGroupsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetMyChatGroups>[];
      json['data'].forEach((v) {
        data!.add(new GetMyChatGroups.fromJson(v));
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

class GetMyChatGroups {
  var sId;
  Project? project;
  List<LastMessage>? lastMessage;
  List<int>? unSeenMessageCount;

  GetMyChatGroups({this.sId, this.project, this.lastMessage, this.unSeenMessageCount});

  GetMyChatGroups.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    if (json['last_message'] != null) {
      lastMessage = <LastMessage>[];
      json['last_message'].forEach((v) {
        lastMessage!.add(new LastMessage.fromJson(v));
      });
    }
    unSeenMessageCount = json['unSeenMessageCount'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.lastMessage != null) {
      data['last_message'] = this.lastMessage!.map((v) => v.toJson()).toList();
    }
    data['unSeenMessageCount'] = this.unSeenMessageCount;
    return data;
  }
}

class Project {
  var name;

  Project({this.name});

  Project.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class LastMessage {
  var sender;
  var content;
  var createdAt;

  LastMessage({this.sender, this.content, this.createdAt});

  LastMessage.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    content = json['content'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
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
