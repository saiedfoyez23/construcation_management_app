class GetEmployeeSingleDayWorkDetailsResponseModel {
  var success;
  var message;
  GetEmployeeSingleDayWorkDetailsResponse? data;

  GetEmployeeSingleDayWorkDetailsResponseModel({this.success, this.message, this.data});

  GetEmployeeSingleDayWorkDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetEmployeeSingleDayWorkDetailsResponse.fromJson(json['data']) : null;
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

class GetEmployeeSingleDayWorkDetailsResponse {
  var sId;
  AddedBy? addedBy;
  var name;
  User? project;
  var description;
  var date;
  var weatherCondition;
  var duration;
  List<Tasks>? tasks;
  var materials;
  var image;
  var location;
  var createdAt;
  var updatedAt;
  var iV;
  var comment;

  GetEmployeeSingleDayWorkDetailsResponse({
    this.sId,
    this.addedBy,
    this.name,
    this.project,
    this.description,
    this.date,
    this.weatherCondition,
    this.duration,
    this.tasks,
    this.materials,
    this.image,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.comment
  });

  GetEmployeeSingleDayWorkDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    addedBy = json['added_by'] != null
        ? new AddedBy.fromJson(json['added_by'])
        : null;
    name = json['name'];
    project =
    json['project'] != null ? new User.fromJson(json['project']) : null;
    description = json['description'];
    date = json['date'];
    weatherCondition = json['weather_condition'];
    duration = json['duration'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
    materials = json['materials'];
    image = json['image'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.addedBy != null) {
      data['added_by'] = this.addedBy!.toJson();
    }
    data['name'] = this.name;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['description'] = this.description;
    data['date'] = this.date;
    data['weather_condition'] = this.weatherCondition;
    data['duration'] = this.duration;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    data['materials'] = this.materials;
    data['image'] = this.image;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['comment'] = this.comment;
    return data;
  }
}

class AddedBy {
  var sId;
  User? user;
  var userType;

  AddedBy({this.sId, this.user, this.userType});

  AddedBy.fromJson(Map<String, dynamic> json) {
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

  User({this.sId, this.name});

  User.fromJson(Map<String, dynamic> json) {
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

class Tasks {
  var name;
  List<Workforces>? workforces;
  List<Equipments>? equipments;
  var sId;

  Tasks({this.name, this.workforces, this.equipments, this.sId});

  Tasks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['workforces'] != null) {
      workforces = <Workforces>[];
      json['workforces'].forEach((v) {
        workforces!.add(new Workforces.fromJson(v));
      });
    }
    if (json['equipments'] != null) {
      equipments = <Equipments>[];
      json['equipments'].forEach((v) {
        equipments!.add(new Equipments.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.workforces != null) {
      data['workforces'] = this.workforces!.map((v) => v.toJson()).toList();
    }
    if (this.equipments != null) {
      data['equipments'] = this.equipments!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Workforces {
  User? workforce;
  var quantity;
  var duration;
  var sId;

  Workforces({this.workforce, this.quantity, this.duration, this.sId});

  Workforces.fromJson(Map<String, dynamic> json) {
    workforce =
    json['workforce'] != null ? new User.fromJson(json['workforce']) : null;
    quantity = json['quantity'];
    duration = json['duration'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.workforce != null) {
      data['workforce'] = this.workforce!.toJson();
    }
    data['quantity'] = this.quantity;
    data['duration'] = this.duration;
    data['_id'] = this.sId;
    return data;
  }
}

class Equipments {
  User? equipment;
  var quantity;
  var duration;
  var sId;

  Equipments({this.equipment, this.quantity, this.duration, this.sId});

  Equipments.fromJson(Map<String, dynamic> json) {
    equipment =
    json['equipment'] != null ? new User.fromJson(json['equipment']) : null;
    quantity = json['quantity'];
    duration = json['duration'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.equipment != null) {
      data['equipment'] = this.equipment!.toJson();
    }
    data['quantity'] = this.quantity;
    data['duration'] = this.duration;
    data['_id'] = this.sId;
    return data;
  }
}
