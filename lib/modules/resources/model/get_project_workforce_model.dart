class GetProjectWorkforceModel {
  GetProjectWorkforceModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<Datum> data;

  factory GetProjectWorkforceModel.fromJson(Map<String, dynamic> json) {
    return GetProjectWorkforceModel(
      success: json["success"],
      message: json["message"],
      data:
          json["data"] == null
              ? []
              : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.project,
    required this.name,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isDeleted,
  });

  final String? id;
  final String? project;
  final String? name;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final bool? isDeleted;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      project: json["project"],
      name: json["name"],
      quantity: json["quantity"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      isDeleted: json["is_deleted"],
    );
  }
}
