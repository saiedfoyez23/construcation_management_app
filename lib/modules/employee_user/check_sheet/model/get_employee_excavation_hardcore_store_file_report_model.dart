class GetEmployeeExcavationHardcoreStoreFileReportModel {
  var success;
  var message;
  GetEmployeeExcavationHardcoreStoreFileReport? data;

  GetEmployeeExcavationHardcoreStoreFileReportModel(
      {this.success, this.message, this.data});

  GetEmployeeExcavationHardcoreStoreFileReportModel.fromJson(
      Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetEmployeeExcavationHardcoreStoreFileReport.fromJson(json['data']) : null;
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

class GetEmployeeExcavationHardcoreStoreFileReport {
  var sId;
  var project;
  var contract;
  var date;
  var drawingReferenceInclRevision;
  var revision;
  var locationOfWork;
  var completionStatus;
  var subContractor;
  var complianceCheck;
  var checkForUndergroundServices;
  var comment;
  var signedOnCompletionSignature;
  var clientApprovedSignature;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var iV;

  GetEmployeeExcavationHardcoreStoreFileReport({
    this.sId,
    this.project,
    this.contract,
    this.date,
    this.drawingReferenceInclRevision,
    this.revision,
    this.locationOfWork,
    this.completionStatus,
    this.subContractor,
    this.complianceCheck,
    this.checkForUndergroundServices,
    this.comment,
    this.signedOnCompletionSignature,
    this.clientApprovedSignature,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetEmployeeExcavationHardcoreStoreFileReport.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    contract = json['contract'];
    date = json['date'];
    drawingReferenceInclRevision = json['drawing_reference_incl_revision'];
    revision = json['revision'];
    locationOfWork = json['location_of_work'];
    completionStatus = json['completion_status'];
    subContractor = json['sub_contractor'];
    complianceCheck = json['compliance_check'];
    checkForUndergroundServices = json['check_for_underground_services'];
    comment = json['comment'];
    signedOnCompletionSignature = json['signed_on_completion_signature'];
    clientApprovedSignature = json['client_approved_signature'];
    updatedBy = json['updated_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['project'] = this.project;
    data['contract'] = this.contract;
    data['date'] = this.date;
    data['drawing_reference_incl_revision'] = this.drawingReferenceInclRevision;
    data['revision'] = this.revision;
    data['location_of_work'] = this.locationOfWork;
    data['completion_status'] = this.completionStatus;
    data['sub_contractor'] = this.subContractor;
    data['compliance_check'] = this.complianceCheck;
    data['check_for_underground_services'] = this.checkForUndergroundServices;
    data['comment'] = this.comment;
    data['signed_on_completion_signature'] = this.signedOnCompletionSignature;
    data['client_approved_signature'] = this.clientApprovedSignature;
    data['updated_by'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
