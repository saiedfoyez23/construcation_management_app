class GetMyProjectModel {
  GetMyProjectModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory GetMyProjectModel.fromJson(Map<String, dynamic> json) {
    return GetMyProjectModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({required this.data, required this.meta});

  final List<Datum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data:
          json["data"] == null
              ? []
              : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.companyAdmin,
    required this.name,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.totalDayWork,
    required this.totalSiteDiary,
    required this.dayWorkImages,
  });

  final String? id;
  final String? companyAdmin;
  final String? name;
  final String? location;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? totalDayWork;
  final int? totalSiteDiary;
  final List<String> dayWorkImages;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      companyAdmin: json["company_admin"],
      name: json["name"],
      location: json["location"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      totalDayWork: json["totalDayWork"],
      totalSiteDiary: json["totalSiteDiary"],
      dayWorkImages:
          json["dayWorkImages"] == null
              ? []
              : List<String>.from(json["dayWorkImages"]!.map((x) => x)),
    );
  }
}

class Meta {
  Meta({required this.total});

  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(total: json["total"]);
  }
}
