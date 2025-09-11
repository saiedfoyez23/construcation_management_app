class GetEmployeeDuctingReportResponseModel {
  var success;
  var message;
  GetEmployeeDuctingReportResponse? data;

  GetEmployeeDuctingReportResponseModel({this.success, this.message, this.data});

  GetEmployeeDuctingReportResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetEmployeeDuctingReportResponse.fromJson(json['data']) : null;
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

class GetEmployeeDuctingReportResponse {
  var sId;
  var project;
  var contract;
  var date;
  var drawingReferenceInclRevision;
  var locationOfWork;
  var completionStatus;
  var subContractor;
  var bedTypeAndThickness;
  var installationPipeType;
  var line;
  var level;
  var position;
  var gradient;
  var popUpDealedOff;
  var testAirWaterCctvMandrill;
  var testCertificateReference;
  var pipeHaunchingSurrounding;
  var pipeType;
  var compaction;
  var backfill;
  var thickness;
  var type;
  var markerTape;
  var installBy;
  var comment;
  var clientApprovedSignature;
  var signedOnCompletionSignature;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var iV;

  GetEmployeeDuctingReportResponse({
    this.sId,
    this.project,
    this.contract,
    this.date,
    this.drawingReferenceInclRevision,
    this.locationOfWork,
    this.completionStatus,
    this.subContractor,
    this.bedTypeAndThickness,
    this.installationPipeType,
    this.line,
    this.level,
    this.position,
    this.gradient,
    this.popUpDealedOff,
    this.testAirWaterCctvMandrill,
    this.testCertificateReference,
    this.pipeHaunchingSurrounding,
    this.pipeType,
    this.compaction,
    this.backfill,
    this.thickness,
    this.type,
    this.markerTape,
    this.installBy,
    this.comment,
    this.clientApprovedSignature,
    this.signedOnCompletionSignature,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetEmployeeDuctingReportResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    project = json['project'];
    contract = json['contract'];
    date = json['date'];
    drawingReferenceInclRevision = json['drawing_reference_incl_revision'];
    locationOfWork = json['location_of_work'];
    completionStatus = json['completion_status'];
    subContractor = json['sub_contractor'];
    bedTypeAndThickness = json['bed_type_and_thickness'];
    installationPipeType = json['installation_pipe_type'];
    line = json['line'];
    level = json['level'];
    position = json['position'];
    gradient = json['gradient'];
    popUpDealedOff = json['pop_up_dealed_off'];
    testAirWaterCctvMandrill = json['test_air_water_cctv_mandrill'];
    testCertificateReference = json['test_certificate_reference'];
    pipeHaunchingSurrounding = json['pipe_haunching_surrounding'];
    pipeType = json['pipe_type'];
    compaction = json['compaction'];
    backfill = json['backfill'];
    thickness = json['thickness'];
    type = json['type'];
    markerTape = json['marker_tape'];
    installBy = json['install_by'];
    comment = json['comment'];
    clientApprovedSignature = json['client_approved_signature'];
    signedOnCompletionSignature = json['signed_on_completion_signature'];
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
    data['location_of_work'] = this.locationOfWork;
    data['completion_status'] = this.completionStatus;
    data['sub_contractor'] = this.subContractor;
    data['bed_type_and_thickness'] = this.bedTypeAndThickness;
    data['installation_pipe_type'] = this.installationPipeType;
    data['line'] = this.line;
    data['level'] = this.level;
    data['position'] = this.position;
    data['gradient'] = this.gradient;
    data['pop_up_dealed_off'] = this.popUpDealedOff;
    data['test_air_water_cctv_mandrill'] = this.testAirWaterCctvMandrill;
    data['test_certificate_reference'] = this.testCertificateReference;
    data['pipe_haunching_surrounding'] = this.pipeHaunchingSurrounding;
    data['pipe_type'] = this.pipeType;
    data['compaction'] = this.compaction;
    data['backfill'] = this.backfill;
    data['thickness'] = this.thickness;
    data['type'] = this.type;
    data['marker_tape'] = this.markerTape;
    data['install_by'] = this.installBy;
    data['comment'] = this.comment;
    data['client_approved_signature'] = this.clientApprovedSignature;
    data['signed_on_completion_signature'] = this.signedOnCompletionSignature;
    data['updated_by'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
