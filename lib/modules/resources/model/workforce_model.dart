class WorkforceModel {
  WorkforceModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory WorkforceModel.fromJson(Map<String, dynamic> json) {
    return WorkforceModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.project,
    required this.name,
    required this.quantity,
    required this.isDeleted,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? project;
  final String? name;
  final int? quantity;
  final bool? isDeleted;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      project: json["project"],
      name: json["name"],
      quantity: json["quantity"],
      isDeleted: json["is_deleted"],
      id: json["_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
