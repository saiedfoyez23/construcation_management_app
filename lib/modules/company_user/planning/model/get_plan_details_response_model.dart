class GetPlanDetailsResponseModel {
  var success;
  var message;
  GetPlanDetails? data;

  GetPlanDetailsResponseModel({this.success, this.message, this.data});

  GetPlanDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetPlanDetails.fromJson(json['data']) : null;
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

class GetPlanDetails {
  var sId;
  AddedBy? addedBy;
  Project? project;
  var name;
  var dueDate;
  var dueTime;
  List<Tasks>? tasks;
  var createdAt;
  var updatedAt;
  var iV;

  GetPlanDetails({
    this.sId,
    this.addedBy,
    this.project,
    this.name,
    this.dueDate,
    this.dueTime,
    this.tasks,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetPlanDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    addedBy = json['added_by'] != null
        ? new AddedBy.fromJson(json['added_by'])
        : null;
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    name = json['name'];
    dueDate = json['due_date'];
    dueTime = json['due_time'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.addedBy != null) {
      data['added_by'] = this.addedBy!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['name'] = this.name;
    data['due_date'] = this.dueDate;
    data['due_time'] = this.dueTime;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class AddedBy {
  var sId;
  var userType;
  User? user;

  AddedBy({this.sId, this.userType, this.user});

  AddedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userType = json['user_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_type'] = this.userType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  var sId;
  var type;
  var name;

  User({this.sId, this.type, this.name});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
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
  Project? workforce;
  var quantity;
  var duration;
  var sId;

  Workforces({this.workforce, this.quantity, this.duration, this.sId});

  Workforces.fromJson(Map<String, dynamic> json) {
    workforce = json['workforce'] != null
        ? new Project.fromJson(json['workforce'])
        : null;
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
  Project? equipment;
  var quantity;
  var duration;
  var sId;

  Equipments({this.equipment, this.quantity, this.duration, this.sId});

  Equipments.fromJson(Map<String, dynamic> json) {
    equipment = json['equipment'] != null
        ? new Project.fromJson(json['equipment'])
        : null;
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
