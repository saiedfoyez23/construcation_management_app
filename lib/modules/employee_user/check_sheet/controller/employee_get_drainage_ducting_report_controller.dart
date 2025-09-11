import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/model/get_employee_ducting_report_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

import '../../../../common/common.dart';

class EmployeeGetDrainageDuctingReportController extends GetxController {

  String projectId;
  RxBool isLoading = false.obs;
  RxBool isPdf = false.obs;
  RxBool isExcelOpen = false.obs;
  EmployeeGetDrainageDuctingReportController({required this.projectId});
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetEmployeeDuctingReportResponseModel> getEmployeeDuctingReportResponseModel = GetEmployeeDuctingReportResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeDuctingReportsController(projectId: projectId);
    });
  }

  Future<void> getEmployeeDuctingReportsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getDuctingReports}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeDuctingReportResponseModel.value = GetEmployeeDuctingReportResponseModel.fromJson(responseBody);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }


  /// ---------- HELPERS ----------
  Future<pw.ImageProvider?> _loadNetworkImage(String? url) async {
    if (url == null || url.isEmpty) return null;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return pw.MemoryImage(response.bodyBytes);
      }
    } catch (_) {}
    return null;
  }

  Future<Uint8List> generatePdf(GetEmployeeDuctingReportResponseModel data) async {
    isPdf.value = true;
    final pdf = pw.Document();

    final fontRegular = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();

    final signedSignature =
    await _loadNetworkImage(data.data!.signedOnCompletionSignature);
    final clientSignature =
    await _loadNetworkImage(data.data!.clientApprovedSignature);

    // Map of all inspection items to render dynamically

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (pw.Context context) => [
          pw.Text("Drainage/Ducting Report",
              style: pw.TextStyle(font: fontBold, fontSize: 20)),
          pw.SizedBox(height: 16),

          pw.Text("Contact: ${data.data?.contract ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Date: ${data.data?.date ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Drawing Reference Incl Revision: ${data.data?.drawingReferenceInclRevision ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Location Of Work: ${data.data?.locationOfWork ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Completion Status: ${data.data?.completionStatus ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Sub-Contractor: ${data.data?.subContractor ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Pipe Type: ${data.data?.pipeType ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Test Certificate Reference: ${data.data?.testCertificateReference ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Install by: ${data.data?.installBy ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Bed Type and Thickness: ${data.data?.bedTypeAndThickness == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Line: ${data.data?.line == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Level: ${data.data?.level == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Position: ${data.data?.position == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Gradient: ${data.data?.gradient == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Pop Up Dealed Off: ${data.data?.popUpDealedOff == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("PIPE HAUNCHING / SURROUNDING: ${data.data?.pipeHaunchingSurrounding == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("COMPACTION: ${data.data?.compaction == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("BACKFILL: ${data.data?.backfill == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("THICKNESS: ${data.data?.thickness == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("TYPE: ${data.data?.type == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("MARKER TAPE: ${data.data?.markerTape == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.SizedBox(height: 10),
          pw.Text("COMMENT: ${data.data?.comment ?? ''}",
              style: pw.TextStyle(font: fontRegular)),

          pw.SizedBox(height: 24),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("Signed on Completion",
                      style: pw.TextStyle(font: fontBold, fontSize: 14)),
                  if (signedSignature != null)
                    pw.Container(height: 60, width: 120, child: pw.Image(signedSignature)),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("Client Approved",
                      style: pw.TextStyle(font: fontBold, fontSize: 14)),
                  if (clientSignature != null)
                    pw.Container(height: 60, width: 120, child: pw.Image(clientSignature)),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    return pdf.save();
  }

  /// ---------- SAVE + OPEN ----------
  Future<void> createAndOpenPdf(GetEmployeeDuctingReportResponseModel response) async {
    final bytes = await generatePdf(response);

    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/drainage_ducting_Report.pdf");
    await file.writeAsBytes(bytes);
    isPdf.value = false;
    await OpenFile.open(file.path);
  }



  // Helper: load image from network
  Future<Uint8List?> _loadNetworkImageExcel(String? url) async {
    if (url == null || url.isEmpty) return null;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (_) {}
    return null;
  }

// Generate Excel file
  Future<void> generateAndOpenExcel(GetEmployeeDuctingReportResponseModel data) async {
    final workbook = xlsio.Workbook();
    final sheet = workbook.worksheets[0];

    // Title
    sheet.getRangeByName('A1').setText('Drainage/Ducting Report');
    sheet.getRangeByName('A1').cellStyle.bold = true;

    // Project info
    sheet.getRangeByName('A3').setText('Contact');
    sheet.getRangeByName('B3').setText('${data.data?.contract ?? ''}');
    sheet.getRangeByName('A4').setText('Date');
    sheet.getRangeByName('B4').setText('${data.data?.date ?? ''}');
    sheet.getRangeByName('A5').setText('Drawing Reference Incl Revision');
    sheet.getRangeByName('B5').setText('${data.data?.drawingReferenceInclRevision ?? ''}');
    sheet.getRangeByName('A7').setText('Location Of Work');
    sheet.getRangeByName('B7').setText('${data.data?.locationOfWork ?? ''}');
    sheet.getRangeByName('A8').setText('Completion Status');
    sheet.getRangeByName('B8').setText('${data.data?.completionStatus ?? ''}');
    sheet.getRangeByName('A9').setText('Sub-Contractor');
    sheet.getRangeByName('B9').setText('${data.data?.subContractor ?? ''}');
    sheet.getRangeByName('A10').setText('Pipe Type');
    sheet.getRangeByName('B10').setText('${data.data?.pipeType ?? ''}');
    sheet.getRangeByName('A11').setText('Test Certificate Reference');
    sheet.getRangeByName('B11').setText('${data.data?.testCertificateReference ?? ''}');
    sheet.getRangeByName('A12').setText('Install By');
    sheet.getRangeByName('B12').setText('${data.data?.installBy ?? ''}');
    sheet.getRangeByName('A13').setText('Bed Type and Thickness');
    sheet.getRangeByName('B13').setText('${data.data?.bedTypeAndThickness == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A14').setText('Line');
    sheet.getRangeByName('B14').setText('${data.data?.line == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A15').setText('Level');
    sheet.getRangeByName('B15').setText('${data.data?.level == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A16').setText('Position');
    sheet.getRangeByName('B16').setText('${data.data?.position == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A17').setText('Gradient');
    sheet.getRangeByName('B17').setText('${data.data?.gradient == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A18').setText('Pop Up Dealed Off');
    sheet.getRangeByName('B18').setText('${data.data?.popUpDealedOff == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A19').setText('Test(Air/Water/CCTV/Mandrill)');
    sheet.getRangeByName('B19').setText('${data.data?.testAirWaterCctvMandrill == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A20').setText('PIPE HAUNCHING / SURROUNDING');
    sheet.getRangeByName('B20').setText('${data.data?.pipeHaunchingSurrounding == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A21').setText('COMPACTION');
    sheet.getRangeByName('B21').setText('${data.data?.compaction == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A22').setText('BACKFILL');
    sheet.getRangeByName('B22').setText('${data.data?.backfill == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A23').setText('THICKNESS');
    sheet.getRangeByName('B23').setText('${data.data?.thickness == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A24').setText('TYPE');
    sheet.getRangeByName('B24').setText('${data.data?.type == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A24').setText('mARKER TAPE');
    sheet.getRangeByName('B24').setText('${data.data?.markerTape == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A25').setText('COMMENT');
    sheet.getRangeByName('B25').setText('${data.data?.comment ?? ''}');

    int row = 27;

    // Add signatures (images)
    final signedSig = await _loadNetworkImageExcel(data.data?.signedOnCompletionSignature);
    final clientSig = await _loadNetworkImageExcel(data.data?.clientApprovedSignature);

    if (signedSig != null) {
      final picture = sheet.pictures.addBase64(
        row,
        1,
        base64Encode(signedSig),
      );
      picture.height = 50;
      picture.width = 100;

      sheet.getRangeByName('A$row').setText('Signed on Completion');

      // ✅ set row height to avoid overlap
      sheet.getRangeByIndex(row, 1).rowHeight = 80;

      row += 6;
    }

    if (clientSig != null) {
      final picture = sheet.pictures.addBase64(
        row,
        1,
        base64Encode(clientSig),
      );
      picture.height = 50;
      picture.width = 100;

      sheet.getRangeByName('A$row').setText('Client Approved');

      // ✅ set row height to avoid overlap
      sheet.getRangeByIndex(row, 1).rowHeight = 80;

      row += 6;
    }

    // Save Excel file
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();



    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/drainage_ducting_Report.xlsx';
    final file = File(path);
    await file.writeAsBytes(bytes, flush: true);
    isExcelOpen.value = false;
    // Open Excel file
    await OpenFile.open(path);
  }




}