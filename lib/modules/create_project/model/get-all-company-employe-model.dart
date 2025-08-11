class GetAllCompanyEmployeModel {
  GetAllCompanyEmployeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<Datum> data;

  factory GetAllCompanyEmployeModel.fromJson(Map<String, dynamic> json){
    return GetAllCompanyEmployeModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.image,
    required this.id,
    required this.type,
    required this.name,
    required this.employeeId,
    required this.email,
    required this.phone,
    required this.companyAdmin,
    required this.v,
  });

  final dynamic image;
  final String? id;
  final String? type;
  final String? name;
  final String? employeeId;
  final String? email;
  final String? phone;
  final String? companyAdmin;
  final int? v;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      image: json["image"],
      id: json["_id"],
      type: json["type"],
      name: json["name"],
      employeeId: json["employee_id"],
      email: json["email"],
      phone: json["phone"],
      companyAdmin: json["company_admin"],
      v: json["__v"],
    );
  }

}
