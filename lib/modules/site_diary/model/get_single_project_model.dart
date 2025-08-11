class GetSingleProjectModel {
  GetSingleProjectModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory GetSingleProjectModel.fromJson(Map<String, dynamic> json){
    return GetSingleProjectModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.clientName,
    required this.companyAdmin,
    required this.name,
    required this.location,
    required this.timeline,
    required this.note,
    required this.supervisor,
    required this.manager,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.folder,
    required this.participants,
  });

  final String? id;
  final String? clientName;
  final String? companyAdmin;
  final String? name;
  final String? location;
  final DateTime? timeline;
  final String? note;
  final String? supervisor;
  final String? manager;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? folder;
  final List<DataParticipant> participants;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      clientName: json["client_name"],
      companyAdmin: json["company_admin"],
      name: json["name"],
      location: json["location"],
      timeline: DateTime.tryParse(json["timeline"] ?? ""),
      note: json["note"],
      supervisor: json["supervisor"],
      manager: json["manager"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      folder: json["folder"],
      participants: json["participants"] == null ? [] : List<DataParticipant>.from(json["participants"]!.map((x) => DataParticipant.fromJson(x))),
    );
  }

}

class DataParticipant {
  DataParticipant({
    required this.id,
    required this.project,
    required this.participants,
    required this.lastMessage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? project;
  final List<ParticipantParticipant> participants;
  final String? lastMessage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory DataParticipant.fromJson(Map<String, dynamic> json){
    return DataParticipant(
      id: json["_id"],
      project: json["project"],
      participants: json["participants"] == null ? [] : List<ParticipantParticipant>.from(json["participants"]!.map((x) => ParticipantParticipant.fromJson(x))),
      lastMessage: json["last_message"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class ParticipantParticipant {
  ParticipantParticipant({
    required this.id,
    required this.user,
    required this.userType,
  });

  final String? id;
  final User? user;
  final String? userType;

  factory ParticipantParticipant.fromJson(Map<String, dynamic> json){
    return ParticipantParticipant(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      userType: json["user_type"],
    );
  }

}

class User {
  User({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  final String? id;
  final String? name;
  final String? image;
  final String? type;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      type: json["type"],
    );
  }

}
