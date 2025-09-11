import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/model/get_employee_excavation_hardcore_store_file_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

import '../../../../common/common.dart';

class EmployeeGetExcavationHardcoreStoreFileReportController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isPdf = false.obs;
  RxBool isExcelOpen = false.obs;
  Rx<GetEmployeeExcavationHardcoreStoreFileReportModel> getEmployeeExcavationHardcoreStoreFileReportModel = GetEmployeeExcavationHardcoreStoreFileReportModel().obs;
  String projectId;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  EmployeeGetExcavationHardcoreStoreFileReportController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeExcavationReportsController(projectId: projectId);
    });
  }

  Future<void> getEmployeeExcavationReportsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getExcavationReports}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeExcavationHardcoreStoreFileReportModel.value = GetEmployeeExcavationHardcoreStoreFileReportModel.fromJson(responseBody);
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

  Future<Uint8List> generatePdf(GetEmployeeExcavationHardcoreStoreFileReportModel data) async {
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
          pw.Text("Excavation / Hardcore / Stone Fill Report",
              style: pw.TextStyle(font: fontBold, fontSize: 20)),
          pw.SizedBox(height: 16),

          pw.Text("Contact: ${data.data?.contract ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Date: ${data.data?.date ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Drawing Reference Incl Revision: ${data.data?.drawingReferenceInclRevision ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Revision: ${data.data?.revision ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Location Of Work: ${data.data?.locationOfWork ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Completion Status: ${data.data?.completionStatus ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Sub-Contractor: ${data.data?.subContractor ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Compliance Check: ${data.data?.complianceCheck == true ? 'Yes' : 'No'}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Check for Underground Services: ${data.data?.checkForUndergroundServices == true ? 'Yes' : 'No'}",
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
  Future<void> createAndOpenPdf(GetEmployeeExcavationHardcoreStoreFileReportModel response) async {
    final bytes = await generatePdf(response);

    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/excavation_hardcore_stone_fill_report.pdf");
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
  Future<void> generateAndOpenExcel(GetEmployeeExcavationHardcoreStoreFileReportModel data) async {
    final workbook = xlsio.Workbook();
    final sheet = workbook.worksheets[0];

    // Title
    sheet.getRangeByName('A1').setText('Excavation / Hardcore / Stone Fill Report');
    sheet.getRangeByName('A1').cellStyle.bold = true;

    // Project info
    sheet.getRangeByName('A3').setText('Contact');
    sheet.getRangeByName('B3').setText('${data.data?.contract ?? ''}');
    sheet.getRangeByName('A4').setText('Date');
    sheet.getRangeByName('B4').setText('${data.data?.date ?? ''}');
    sheet.getRangeByName('A5').setText('Drawing Reference Incl Revision');
    sheet.getRangeByName('B5').setText('${data.data?.drawingReferenceInclRevision ?? ''}');
    sheet.getRangeByName('A6').setText('Revision');
    sheet.getRangeByName('B6').setText('${data.data?.revision ?? ''}');
    sheet.getRangeByName('A7').setText('Location Of Work');
    sheet.getRangeByName('B7').setText('${data.data?.locationOfWork ?? ''}');
    sheet.getRangeByName('A8').setText('Completion Status');
    sheet.getRangeByName('B8').setText('${data.data?.completionStatus ?? ''}');
    sheet.getRangeByName('A9').setText('Sub-Contractor');
    sheet.getRangeByName('B9').setText('${data.data?.subContractor ?? ''}');
    sheet.getRangeByName('A10').setText('Compliance Check');
    sheet.getRangeByName('B10').setText('${data.data?.complianceCheck == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A11').setText('Check for Underground Services');
    sheet.getRangeByName('B11').setText('${data.data?.checkForUndergroundServices == true ? 'Yes' : 'No'}');
    sheet.getRangeByName('A12').setText('COMMENT');
    sheet.getRangeByName('B12').setText('${data.data?.comment ?? ''}');

    int row = 15;

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
    final path = '${dir.path}/excavation_hardcore_stone_fill_report.xlsx';
    final file = File(path);
    await file.writeAsBytes(bytes, flush: true);
    isExcelOpen.value = false;
    // Open Excel file
    await OpenFile.open(path);
  }


}