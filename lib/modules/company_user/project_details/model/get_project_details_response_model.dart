class GetProjectDetailsResponseModel {
  var success;
  var message;
  GetProjectDetailsResponse? data;

  GetProjectDetailsResponseModel({this.success, this.message, this.data});

  GetProjectDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetProjectDetailsResponse.fromJson(json['data']) : null;
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

class GetProjectDetailsResponse {
  var sId;
  var clientName;
  var companyAdmin;
  var name;
  var location;
  var timeline;
  var note;
  var supervisor;
  var manager;
  var createdAt;
  var updatedAt;
  var iV;
  var folder;
  List<Participants>? participants;

  GetProjectDetailsResponse({
    this.sId,
    this.clientName,
    this.companyAdmin,
    this.name,
    this.location,
    this.timeline,
    this.note,
    this.supervisor,
    this.manager,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.folder,
    this.participants,
  });

  GetProjectDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clientName = json['client_name'];
    companyAdmin = json['company_admin'];
    name = json['name'];
    location = json['location'];
    timeline = json['timeline'];
    note = json['note'];
    supervisor = json['supervisor'];
    manager = json['manager'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    folder = json['folder'];
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(new Participants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['client_name'] = this.clientName;
    data['company_admin'] = this.companyAdmin;
    data['name'] = this.name;
    data['location'] = this.location;
    data['timeline'] = this.timeline;
    data['note'] = this.note;
    data['supervisor'] = this.supervisor;
    data['manager'] = this.manager;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['folder'] = this.folder;
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Participants {
  var sId;
  var project;
  List<ParticipantsDetails>? participants;
  var lastMessage;
  var createdAt;
  var updatedAt;
  var iV;

  Participants({
    this.sId,
    this.project,
    this.participants,
    this.lastMessage,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Participants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    if (json['participants'] != null) {
      participants = <ParticipantsDetails>[];
      json['participants'].forEach((v) {
        participants!.add(new ParticipantsDetails.fromJson(v));
      });
    }
    lastMessage = json['last_message'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['project'] = this.project;
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    data['last_message'] = this.lastMessage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ParticipantsDetails {
  String? sId;
  User? user;
  String? userType;

  ParticipantsDetails({this.sId, this.user, this.userType});

  ParticipantsDetails.fromJson(Map<String, dynamic> json) {
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
  var type;

  User({this.sId, this.name, this.image, this.type});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['type'] = this.type;
    return data;
  }
}
