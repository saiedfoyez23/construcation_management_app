import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/check_sheet/model/get_employee_post_pour_inspection_report_response_model.dart';
import 'package:construction_management_app/modules/employee_user/project_details/model/get_employee_project_details_response_model.dart';
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

class EmployeeGetPostPourInspectionReportController extends GetxController {
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetEmployeePostPourInspectionReportResponseModel> getEmployeePostPourInspectionReportResponseModel = GetEmployeePostPourInspectionReportResponseModel().obs;
  Rx<GetEmployeeProjectDetailsResponseModel> getEmployeeProjectDetailsResponseModel = GetEmployeeProjectDetailsResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isPdf = false.obs;
  RxBool isExcelOpen = false.obs;
  String projectId;
  EmployeeGetPostPourInspectionReportController({required this.projectId});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeProjectDetailsController(projectId: projectId);
      await getEmployeePostPourInspectionReportsController(projectId: projectId);
    });
  }


  Future<void> getEmployeeProjectDetailsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.projectDetails}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeProjectDetailsResponseModel.value = GetEmployeeProjectDetailsResponseModel.fromJson(responseBody);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      //isLoading(false);
    }
  }


  Future<void> getEmployeePostPourInspectionReportsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getPostPourInspectionReports}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeePostPourInspectionReportResponseModel.value = GetEmployeePostPourInspectionReportResponseModel.fromJson(responseBody);
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

  Future<Uint8List> generatePdf(GetEmployeePostPourInspectionReportResponse data) async {
    isPdf.value = true;
    final pdf = pw.Document();

    final fontRegular = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();

    final signedSignature =
    await _loadNetworkImage(data.signedOnCompletionSignature);
    final clientSignature =
    await _loadNetworkImage(data.clientApprovedSignature);

    // Map of all inspection items to render dynamically
    final inspectionItems = {
      "Concrete Finish Type": data.concreteFinishType,
      "Chamfers/Edging": data.chamfersEdgingEtc,
      "Drainage Elements": data.drainageElements,
      "Holding Down Bolts": data.holdingDownBolts,
      "Crack Inducers": data.crackInducers,
      "Waterproofing Membrane": data.waterproofingMembrane,
      "Others": data.others,
    };

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (pw.Context context) => [
          pw.Text("Post Pour Inspection Report",
              style: pw.TextStyle(font: fontBold, fontSize: 20)),
          pw.SizedBox(height: 16),

          pw.Text("Project: ${getEmployeeProjectDetailsResponseModel.value.data?.name ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Pour No: ${data.pourNo ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Pour Date: ${data.pourDate ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Inspection Date: ${data.inspectionDate ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Drawing/Sketch No. & Revision: ${data.drawingNo ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("GA Drawing: ${data.drawingNo ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Rebar Drgs: ${data.rebarDrgs ?? ''}",
              style: pw.TextStyle(font: fontRegular)),
          pw.Text("Pour Reference: ${data.pourReference ?? ''}",
              style: pw.TextStyle(font: fontRegular)),

          pw.SizedBox(height: 16),

          if (data.settingOut != null) ...[
            pw.Text("Setting Out",
                style: pw.TextStyle(font: fontBold, fontSize: 16)),
            pw.Text("Line: ${data.settingOut!.line ?? ''}",
                style: pw.TextStyle(font: fontRegular)),
            pw.Text("Inspection: ${data.settingOut!.inspection == true ? "Yes" : "No"}",
                style: pw.TextStyle(font: fontRegular)),
            pw.Text("Comment: ${data.settingOut!.comment ?? ''}",
                style: pw.TextStyle(font: fontRegular)),
            pw.SizedBox(height: 12),
          ],

          pw.Text("Inspection Items",
              style: pw.TextStyle(font: fontBold, fontSize: 16)),
          pw.SizedBox(height: 8),

          // Loop through inspection items
          ...inspectionItems.entries.map((entry) {
            final item = entry.value;
            if (item == null) return pw.SizedBox();
            return pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(entry.key,
                      style: pw.TextStyle(font: fontBold, fontSize: 14)),
                  pw.Text("Inspection: ${item.inspection == true ? "Yes" : "No"}",
                      style: pw.TextStyle(font: fontRegular)),
                  pw.Text("Comment: ${item.comment ?? ''}",
                      style: pw.TextStyle(font: fontRegular)),
                ],
              ),
            );
          }),

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
  Future<void> createAndOpenPdf(GetEmployeePostPourInspectionReportResponse response) async {
    final bytes = await generatePdf(response);

    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/post_pour_inspection.pdf");
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
  Future<void> generateAndOpenExcel(GetEmployeePostPourInspectionReportResponse data) async {
    final workbook = xlsio.Workbook();
    final sheet = workbook.worksheets[0];

    // Title
    sheet.getRangeByName('A1').setText('Post Pour Inspection Report');
    sheet.getRangeByName('A1').cellStyle.bold = true;

    // Project info
    sheet.getRangeByName('A3').setText('Project');
    sheet.getRangeByName('B3').setText('${getEmployeeProjectDetailsResponseModel.value.data?.name ?? ''}');
    sheet.getRangeByName('A4').setText('Pour No');
    sheet.getRangeByName('B4').setText('${data.pourNo ?? ''}');
    sheet.getRangeByName('A5').setText('Pour Date');
    sheet.getRangeByName('B5').setText('${data.pourDate ?? ''}');
    sheet.getRangeByName('A6').setText('Inspection Date');
    sheet.getRangeByName('B6').setText('${data.inspectionDate ?? ''}');
    sheet.getRangeByName('A7').setText('Drawing/Sketch No. & Revision');
    sheet.getRangeByName('B7').setText('${data.drawingNo ?? ''}');
    sheet.getRangeByName('A8').setText('GA Drawing');
    sheet.getRangeByName('B8').setText('${data.gaDrawing ?? ''}');
    sheet.getRangeByName('A9').setText('Rebar Drgs');
    sheet.getRangeByName('B9').setText('${data.rebarDrgs ?? ''}');
    sheet.getRangeByName('A10').setText('Temporary Works');
    sheet.getRangeByName('B10').setText('${data.temporaryWorks ?? ''}');
    sheet.getRangeByName('A11').setText('Pour Reference');
    sheet.getRangeByName('B11').setText('${data.pourReference ?? ''}');


    int row = 13;
    sheet.getRangeByName('A$row').setText('Inspection Items');
    sheet.getRangeByName('A$row').cellStyle.bold = true;
    row++;

    final inspectionItems = {
      "Concrete Finish Type": data.concreteFinishType,
      "Chamfers/Edging": data.chamfersEdgingEtc,
      "Drainage Elements": data.drainageElements,
      "Holding Down Bolts": data.holdingDownBolts,
      "Crack Inducers": data.crackInducers,
      "Waterproofing Membrane": data.waterproofingMembrane,
      "Others": data.others,
    };

    for (var entry in inspectionItems.entries) {
      final item = entry.value;
      if (item == null) continue;
      sheet.getRangeByName('A$row').setText(entry.key);
      sheet.getRangeByName('B$row').setText('${item.inspection ?? ''}');
      sheet.getRangeByName('C$row').setText('${item.comment ?? ''}');
      row++;
    }

    // Add signatures (images)
    final signedSig = await _loadNetworkImageExcel(data.signedOnCompletionSignature);
    final clientSig = await _loadNetworkImageExcel(data.clientApprovedSignature);

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
    final path = '${dir.path}/post_pour_inspection_report.xlsx';
    final file = File(path);
    await file.writeAsBytes(bytes, flush: true);
    isExcelOpen.value = false;
    // Open Excel file
    await OpenFile.open(path);
  }

}