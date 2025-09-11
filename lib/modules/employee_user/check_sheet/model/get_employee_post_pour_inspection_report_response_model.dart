class GetEmployeePostPourInspectionReportResponseModel {
  var success;
  var message;
  GetEmployeePostPourInspectionReportResponse? data;

  GetEmployeePostPourInspectionReportResponseModel(
      {this.success, this.message, this.data});

  GetEmployeePostPourInspectionReportResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetEmployeePostPourInspectionReportResponse.fromJson(json['data']) : null;
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

class GetEmployeePostPourInspectionReportResponse {
  SettingOut? settingOut;
  var sId;
  var project;
  var pourNo;
  var pourDate;
  var inspectionDate;
  var drawingNo;
  var gaDrawing;
  var temporaryWorks;
  var pourReference;
  var rebarDrgs;
  ConcreteFinishType? concreteFinishType;
  ConcreteFinishType? chamfersEdgingEtc;
  ConcreteFinishType? drainageElements;
  ConcreteFinishType? holdingDownBolts;
  ConcreteFinishType? crackInducers;
  ConcreteFinishType? waterproofingMembrane;
  ConcreteFinishType? others;
  var signedOnCompletionSignature;
  var clientApprovedSignature;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var iV;

  GetEmployeePostPourInspectionReportResponse({
    this.settingOut,
    this.sId,
    this.project,
    this.pourNo,
    this.pourDate,
    this.inspectionDate,
    this.drawingNo,
    this.gaDrawing,
    this.temporaryWorks,
    this.pourReference,
    this.rebarDrgs,
    this.concreteFinishType,
    this.chamfersEdgingEtc,
    this.drainageElements,
    this.holdingDownBolts,
    this.crackInducers,
    this.waterproofingMembrane,
    this.others,
    this.signedOnCompletionSignature,
    this.clientApprovedSignature,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetEmployeePostPourInspectionReportResponse.fromJson(Map<String, dynamic> json) {
    settingOut = json['setting_out'] != null
        ? new SettingOut.fromJson(json['setting_out'])
        : null;
    sId = json['_id'];
    project = json['project'];
    pourNo = json['pour_no'];
    pourDate = json['pour_date'];
    inspectionDate = json['inspection_date'];
    drawingNo = json['drawing_no'];
    gaDrawing = json['ga_drawing'];
    temporaryWorks = json['temporary_works'];
    pourReference = json['pour_reference'];
    rebarDrgs = json['rebar_drgs'];
    concreteFinishType = json['concrete_finish_type'] != null
        ? new ConcreteFinishType.fromJson(json['concrete_finish_type'])
        : null;
    chamfersEdgingEtc = json['chamfers_edging_etc'] != null
        ? new ConcreteFinishType.fromJson(json['chamfers_edging_etc'])
        : null;
    drainageElements = json['drainage_elements'] != null
        ? new ConcreteFinishType.fromJson(json['drainage_elements'])
        : null;
    holdingDownBolts = json['holding_down_bolts'] != null
        ? new ConcreteFinishType.fromJson(json['holding_down_bolts'])
        : null;
    crackInducers = json['crack_inducers'] != null
        ? new ConcreteFinishType.fromJson(json['crack_inducers'])
        : null;
    waterproofingMembrane = json['waterproofing_membrane'] != null
        ? new ConcreteFinishType.fromJson(json['waterproofing_membrane'])
        : null;
    others = json['others'] != null
        ? new ConcreteFinishType.fromJson(json['others'])
        : null;
    signedOnCompletionSignature = json['signed_on_completion_signature'];
    clientApprovedSignature = json['client_approved_signature'];
    updatedBy = json['updated_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settingOut != null) {
      data['setting_out'] = this.settingOut!.toJson();
    }
    data['_id'] = this.sId;
    data['project'] = this.project;
    data['pour_no'] = this.pourNo;
    data['pour_date'] = this.pourDate;
    data['inspection_date'] = this.inspectionDate;
    data['drawing_no'] = this.drawingNo;
    data['ga_drawing'] = this.gaDrawing;
    data['temporary_works'] = this.temporaryWorks;
    data['pour_reference'] = this.pourReference;
    data['rebar_drgs'] = this.rebarDrgs;
    if (this.concreteFinishType != null) {
      data['concrete_finish_type'] = this.concreteFinishType!.toJson();
    }
    if (this.chamfersEdgingEtc != null) {
      data['chamfers_edging_etc'] = this.chamfersEdgingEtc!.toJson();
    }
    if (this.drainageElements != null) {
      data['drainage_elements'] = this.drainageElements!.toJson();
    }
    if (this.holdingDownBolts != null) {
      data['holding_down_bolts'] = this.holdingDownBolts!.toJson();
    }
    if (this.crackInducers != null) {
      data['crack_inducers'] = this.crackInducers!.toJson();
    }
    if (this.waterproofingMembrane != null) {
      data['waterproofing_membrane'] = this.waterproofingMembrane!.toJson();
    }
    if (this.others != null) {
      data['others'] = this.others!.toJson();
    }
    data['signed_on_completion_signature'] = this.signedOnCompletionSignature;
    data['client_approved_signature'] = this.clientApprovedSignature;
    data['updated_by'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SettingOut {
  var line;
  var inspection;
  var comment;

  SettingOut({this.line, this.inspection, this.comment});

  SettingOut.fromJson(Map<String, dynamic> json) {
    line = json['line'];
    inspection = json['inspection'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line'] = this.line;
    data['inspection'] = this.inspection;
    data['comment'] = this.comment;
    return data;
  }
}

class ConcreteFinishType {
  var inspection;
  var comment;
  var sId;

  ConcreteFinishType({this.inspection, this.comment, this.sId});

  ConcreteFinishType.fromJson(Map<String, dynamic> json) {
    inspection = json['inspection'];
    comment = json['comment'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inspection'] = this.inspection;
    data['comment'] = this.comment;
    data['_id'] = this.sId;
    return data;
  }
}
