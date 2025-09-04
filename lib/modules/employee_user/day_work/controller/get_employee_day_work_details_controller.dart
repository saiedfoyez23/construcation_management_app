import 'dart:convert';
import 'dart:io';

import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/data/base_client.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/employee_user/day_work/model/get_single_day_work_details_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/employee_user/resources/model/get_employee_all_workforces_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

import '../../../../common/common.dart';

class GetEmployeeDayWorkDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPdf = false.obs;
  RxBool isExcelOpen = false.obs;
  RxList<EmployeeDayWorkWorkforce> workforce = <EmployeeDayWorkWorkforce>[].obs;
  RxList<EmployeeDayWorkEquipment> equipment = <EmployeeDayWorkEquipment>[].obs;
  RxList<EmployeeDayWorkDetailsTask> taskList = <EmployeeDayWorkDetailsTask>[].obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetEmployeeSingleDayWorkDetailsResponseModel> getEmployeeSingleDayWorkDetailsResponseModel = GetEmployeeSingleDayWorkDetailsResponseModel().obs;
  Rx<GetEmployeeAllEquipmentsResponseModel> getEmployeeAllEquipmentsResponseModel = GetEmployeeAllEquipmentsResponseModel().obs;
  Rx<GetEmployeeAllWorkforcesResponseModel> getEmployeeAllWorkforcesResponseModel = GetEmployeeAllWorkforcesResponseModel().obs;
  String dayWorkId;
  String projectId;
  GetEmployeeDayWorkDetailsController({required this.dayWorkId,required this.projectId});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getEmployeeAllEquipmentsController(projectId: projectId);
      await getEmployeeAllWorkforceController(projectId: projectId);
      await getEmployeeDayWorkDetailsController(dayWorkId: dayWorkId);
    });
  }


  Future<void> getEmployeeDayWorkDetailsController({required String dayWorkId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.detailsDayWork}/${dayWorkId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeSingleDayWorkDetailsResponseModel.value = GetEmployeeSingleDayWorkDetailsResponseModel.fromJson(responseBody);
        taskList.value = getEmployeeSingleDayWorkDetailsResponseModel.value.toTaskList();
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


  Future<void> getPdfExcelController({required String dayWorkId,required bool isExcel,required BuildContext context}) async {
    try {
      if(isExcel == true) {
        isExcelOpen.value = true;


        loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


        var headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
        };

        dynamic responseBody = await BaseClient.handleResponse(
          await BaseClient.getRequest(
            api: "${Api.detailsDayWork}/${dayWorkId}",
            headers: headers,
          ),
        );

        if (responseBody != null) {
          print("hello ${jsonEncode(responseBody)}");
          await generateAndSaveExcel(context: context, responseJson: responseBody);
        } else {
          throw "Data retrieve is Failed";
        }

      } else {

        isPdf.value = true;


        loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


        var headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
        };

        dynamic responseBody = await BaseClient.handleResponse(
          await BaseClient.getRequest(
            api: "${Api.detailsDayWork}/${dayWorkId}",
            headers: headers,
          ),
        );

        if (responseBody != null) {
          print("hello ${jsonEncode(responseBody)}");
          await generateAndSavePdf(responseBody);
        } else {
          throw "Data retrieve is Failed";
        }
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isExcel == true ? isExcelOpen(false) : isPdf(false);
    }
  }

  Future<void> getEmployeeAllWorkforceController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getProjectWorkforce}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllWorkforcesResponseModel.value = GetEmployeeAllWorkforcesResponseModel.fromJson(responseBody);
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


  Future<void> getEmployeeAllEquipmentsController({required String projectId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.getProjectEquipments}/${projectId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getEmployeeAllEquipmentsResponseModel.value = GetEmployeeAllEquipmentsResponseModel.fromJson(responseBody);
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

  Future<void> generateAndSavePdf(Map<String, dynamic> responseJson) async {
    final pdf = pw.Document();

    final data = responseJson['data'];

    Uint8List? imageBytes;
    try {
      final response = await http.get(Uri.parse(data['image']));
      if (response.statusCode == 200) {
        imageBytes = response.bodyBytes;
      }
    } catch (e) {
      print("Image load failed: $e");
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return [
            pw.Container(
              width: PdfPageFormat.a4.availableWidth * 0.6,
              child: pw.Text(
                "Site Diary Report",
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 16),

            buildField("Project Name", data['project']['name'] ?? ""),
            buildField("Diary Name", data['name'] ?? ""),
            buildField("Description", data['description'] ?? ""),
            buildField("Location", data['location'] ?? ""),
            buildField("Date", data['date'] ?? ""),
            buildField("Weather", data['weather_condition'] ?? ""),
            buildField("Delay", data['duration'] ?? ""),
            buildField("Comment", data['comment'] ?? ""),
            buildField("Materials Used", data['materials'] ?? ""),


            pw.SizedBox(height: 15),

            // 🖼️ Insert Image
            if (imageBytes != null) ...[
              pw.Text("Attached Image:",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Image(pw.MemoryImage(imageBytes), height: 200),
              pw.SizedBox(height: 20),
            ],
            

            pw.Text("Tasks:",
                style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            ...List.generate((data['tasks'] as List).length, (index) {
              final task = data['tasks'][index];
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("${task['name']}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text("  Workforces:"),
                  ...List.generate((task['workforces'] as List).length, (i) {
                    final wf = task['workforces'][i];
                    return pw.Text(
                        "   - ${wf['workforce']['name']} | Qty: ${wf['quantity']} | Duration: ${wf['duration']}");
                  }),
                  pw.Text("  Equipments:"),
                  ...List.generate((task['equipments'] as List).length, (i) {
                    final eq = task['equipments'][i];
                    return pw.Text(
                        "   - ${eq['equipment']['name']} | Qty: ${eq['quantity']} | Duration: ${eq['duration']}");
                  }),
                  pw.SizedBox(height: 10),
                ],
              );
            }),
          ];
        },
      ),
    );

    // Save to local storage
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/day_work_report.pdf");
    await file.writeAsBytes(await pdf.save());

    final result = await OpenFile.open(file.path);
    if (result.type != ResultType.done) {
      print('Failed to open file: ${result.message}');
    } else {
      print('File opened successfully');
    }

  }

  pw.Widget buildField(String title, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          value,
          style: pw.TextStyle(fontSize: 12),
        ),
        pw.SizedBox(height: 12),
      ],
    );
  }

  /// Generate Excel File
  Future<void> generateAndSaveExcel({required BuildContext context,required Map<String, dynamic> responseJson}) async {
    final data = responseJson["data"];

    // Create a new Excel workbook
    final xlsio.Workbook workbook = xlsio.Workbook();
    final xlsio.Worksheet sheet = workbook.worksheets[0];

    // Title
    sheet.getRangeByName('A1').setText('Site Diary Report');
    sheet.getRangeByName('A1').cellStyle.bold = true;

    // Basic Info
    sheet.getRangeByName('A2').setText('Project Name');
    sheet.getRangeByName('B2').setText(data['project']['name']);

    sheet.getRangeByName('A3').setText('Diary Name');
    sheet.getRangeByName('B3').setText(data['name']);

    sheet.getRangeByName('A4').setText('Added By');
    sheet.getRangeByName('B4').setText("${data['added_by']['user']['name']} (${data['added_by']['user_type']})");

    sheet.getRangeByName('A5').setText('Date');
    sheet.getRangeByName('B5').setText(data['date']);

    sheet.getRangeByName('A6').setText('Weather');
    sheet.getRangeByName('B6').setText(data['weather_condition']);

    sheet.getRangeByName('A7').setText('Delay');
    sheet.getRangeByName('B7').setText(data['duration']);

    sheet.getRangeByName('A8').setText('Location');
    sheet.getRangeByName('B8').setText(data['location']);

    sheet.getRangeByName('A9').setText('Description');
    sheet.getRangeByName('B9').setText(data['description']);


    sheet.getRangeByName('A10').setText('Materials Used');
    sheet.getRangeByName('B10').setText(data['materials']);


    // Tasks
    int row = 12;
    sheet.getRangeByName('A$row').setText('Tasks');
    sheet.getRangeByName('A$row').cellStyle.bold = true;
    row++;

    for (var task in data['tasks']) {
      sheet.getRangeByIndex(row, 1).setText("Task: ${task['name']}");
      row++;

      sheet.getRangeByIndex(row, 1).setText("Workforces");
      row++;
      for (var wf in task['workforces']) {
        sheet.getRangeByIndex(row, 1).setText(wf['workforce']['name']);
        sheet.getRangeByIndex(row, 2).setNumber(wf['quantity'].toDouble());
        sheet.getRangeByIndex(row, 3).setText(wf['duration']);
        row++;
      }

      sheet.getRangeByIndex(row, 1).setText("Equipments");
      row++;
      for (var eq in task['equipments']) {
        sheet.getRangeByIndex(row, 1).setText(eq['equipment']['name']);
        sheet.getRangeByIndex(row, 2).setNumber(eq['quantity'].toDouble());
        sheet.getRangeByIndex(row, 3).setText(eq['duration']);
        row++;
      }

      row++;
    }

    // Comment
    sheet.getRangeByIndex(row, 1).setText("Comment");
    sheet.getRangeByIndex(row, 2).setText(data['comment']);
    row += 2;

    // 🖼️ Insert Image from URL
    try {
      final response = await http.get(Uri.parse(data['image']));
      if (response.statusCode == 200) {
        final Uint8List imageBytes = response.bodyBytes;
        final String base64Image = base64Encode(imageBytes);
        final xlsio.Picture picture = sheet.pictures.addBase64(row, 1, base64Image);
        picture.height = 200; // resize image
        picture.width = 300;
      }
    } catch (e) {
      print("Image insert failed: $e");
    }

    // Save Excel
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/day_work_with_image.xlsx");
    await file.writeAsBytes(bytes, flush: true);

    final result = await OpenFile.open(file.path);
    if (result.type != ResultType.done) {
      print('Failed to open file: ${result.message}');
    } else {
      print('File opened successfully');
    }
  }


}



class EmployeeDayWorkDetailsTask {
  final String name;
  final List<EmployeeDayWorkWorkforce> workforce;
  final List<EmployeeDayWorkEquipment> equipment;

  EmployeeDayWorkDetailsTask(this.name, this.workforce, this.equipment);

}

class EmployeeDayWorkWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeeDayWorkWorkforce(this.typeId, this.quantity, this.duration);

}

class EmployeeDayWorkEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  EmployeeDayWorkEquipment(this.typeId, this.quantity, this.duration);
}


extension DayWorkMapper on GetEmployeeSingleDayWorkDetailsResponseModel {
  List<EmployeeDayWorkDetailsTask> toTaskList() {
    if (data?.tasks == null) return [];

    return data!.tasks!.map((task) {
      // Map Workforces
      final workforceList = task.workforces?.map((wf) {
        return EmployeeDayWorkWorkforce(
          wf.workforce?.sId ?? "",
          (wf.quantity is int)
              ? wf.quantity
              : int.tryParse(wf.quantity.toString()) ?? 0,
          _parseDurationToInt(wf.duration),
        );
      }).toList() ?? [];

      // Map Equipments
      final equipmentList = task.equipments?.map((eq) {
        return EmployeeDayWorkEquipment(
          eq.equipment?.sId ?? "",
          (eq.quantity is int)
              ? eq.quantity
              : int.tryParse(eq.quantity.toString()) ?? 0,
          _parseDurationToInt(eq.duration),
        );
      }).toList() ?? [];

      // Return Task
      return EmployeeDayWorkDetailsTask(
        task.name ?? "",
        workforceList,
        equipmentList,
      );
    }).toList();
  }
}

/// Helper function to convert "25 hours" → 25
int _parseDurationToInt(dynamic duration) {
  if (duration == null) return 0;
  if (duration is int) return duration;

  final str = duration.toString().trim();
  final number = int.tryParse(str.split(" ").first);
  return number ?? 0;
}