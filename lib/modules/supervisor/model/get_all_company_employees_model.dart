class GetAllCompanyEmployeesModel {
  GetAllCompanyEmployeesModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<Datum> data;

  factory GetAllCompanyEmployeesModel.fromJson(Map<String, dynamic> json) {
    return GetAllCompanyEmployeesModel(
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
    required this.type,
    required this.name,
    required this.employeeId,
    required this.email,
    required this.phone,
    required this.companyAdmin,
    required this.v,
    required this.image,
  });

  final String? id;
  final String? type;
  final String? name;
  final String? employeeId;
  final String? email;
  final String? phone;
  final String? companyAdmin;
  final int? v;
  final String? image;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      type: json["type"],
      name: json["name"],
      employeeId: json["employee_id"],
      email: json["email"],
      phone: json["phone"],
      companyAdmin: json["company_admin"],
      v: json["__v"],
      image: json["image"],
    );
  }
}
