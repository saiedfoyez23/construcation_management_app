import 'dart:convert';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:construction_management_app/modules/resources/model/get_all_equipments_response_model.dart';
import 'package:construction_management_app/modules/resources/model/get_all_workforces_response_model.dart';
import 'package:construction_management_app/modules/site_diary/model/get_single_site_diary_details_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import '../../../common/common.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class GetSiteDiaryDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPdf = false.obs;
  RxList<SiteDiaryDetailsWorkforce> workforce = <SiteDiaryDetailsWorkforce>[].obs;
  RxList<SiteDiaryDetailsEquipment> equipment = <SiteDiaryDetailsEquipment>[].obs;
  RxList<SiteDiaryDetailsTask> taskList = <SiteDiaryDetailsTask>[].obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel().obs;
  Rx<GetSingleSiteDiaryDetailsResponseModel> getSingleSiteDiaryDetailsResponseModel = GetSingleSiteDiaryDetailsResponseModel().obs;
  Rx<GetAllEquipmentsResponseModel> getAllEquipmentsResponseModel = GetAllEquipmentsResponseModel().obs;
  Rx<GetAllWorkforcesResponseModel> getAllWorkforcesResponseModel = GetAllWorkforcesResponseModel().obs;
  String siteDiaryId;
  String projectId;
  GetSiteDiaryDetailsController({required this.siteDiaryId,required this.projectId});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading(true);
    Future.delayed(Duration(seconds: 1),() async {
      await getAllEquipmentsController(projectId: projectId);
      await getAllWorkforceController(projectId: projectId);
      await getSiteDiaryDetailsController(siteDiaryId: siteDiaryId);
    });
  }





  Future<void> getSiteDiaryDetailsController({required String siteDiaryId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.detailsSiteDiary}/${siteDiaryId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        getSingleSiteDiaryDetailsResponseModel.value = GetSingleSiteDiaryDetailsResponseModel.fromJson(responseBody);
        final siteDiaryData = getSingleSiteDiaryDetailsResponseModel.value.data;
        taskList.value = siteDiaryData?.toTaskList() ?? [];
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



  Future<void> getPdfController({required String siteDiaryId}) async {
    try {
      loginResponseModel.value = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));


      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginResponseModel.value.data!.accessToken}',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: "${Api.detailsSiteDiary}/${siteDiaryId}",
          headers: headers,
        ),
      );

      if (responseBody != null) {
        print("hello ${jsonEncode(responseBody)}");
        await generateAndSavePdf(responseBody);
      } else {
        throw "Data retrieve is Failed";
      }
    } catch (e) {
      debugPrint("Catch Error.........$e");
      kSnackBar(message: "Data retrieve is Failed: $e", bgColor: AppColors.red);
    } finally {
      isPdf(false);
    }
  }

  Future<void> getAllWorkforceController({required String projectId}) async {
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
        getAllWorkforcesResponseModel.value = GetAllWorkforcesResponseModel.fromJson(responseBody);
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


  Future<void> getAllEquipmentsController({required String projectId}) async {
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
        getAllEquipmentsResponseModel.value = GetAllEquipmentsResponseModel.fromJson(responseBody);
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

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text("Site Diary Report",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 16),

                pw.Text("Project Name: ${data['project']['name']}"),
                pw.Text("Diary Name: ${data['name']}"),
                pw.Text("Description: ${data['description']}"),
                pw.Text("Location: ${data['location']}"),
                pw.Text("Date: ${data['date']}"),
                pw.Text("Weather: ${data['weather_condition']}"),
                pw.Text("Duration: ${data['duration']}"),
                pw.Text("Comment: ${data['comment']}"),
                pw.SizedBox(height: 16),

                pw.Text("Workforces:", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                ...List.generate(
                  (data['tasks'][0]['workforces'] as List).length,
                      (i) {
                    var wf = data['tasks'][0]['workforces'][i];
                    return pw.Text(
                        "- ${wf['workforce']['name']} | Qty: ${wf['quantity']} | Duration: ${wf['duration']}");
                  },
                ),
                pw.SizedBox(height: 12),

                pw.Text("Equipments:", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                ...List.generate(
                  (data['tasks'][0]['equipments'] as List).length,
                      (i) {
                    var eq = data['tasks'][0]['equipments'][i];
                    return pw.Text(
                        "- ${eq['equipment']['name']} | Qty: ${eq['quantity']} | Duration: ${eq['duration']}");
                  },
                ),
              ],
            ),
          );
        },
      ),
    );

    // Save to local storage
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/site_diary_report.pdf");
    await file.writeAsBytes(await pdf.save());

    final result = await OpenFile.open(file.path);
    if (result.type != ResultType.done) {
      print('Failed to open file: ${result.message}');
    } else {
      print('File opened successfully');
    }

  }


}



class SiteDiaryDetailsTask {
  final String name;
  final List<SiteDiaryDetailsWorkforce> workforce;
  final List<SiteDiaryDetailsEquipment> equipment;

  SiteDiaryDetailsTask(this.name, this.workforce, this.equipment);

}

class SiteDiaryDetailsWorkforce {
  final String typeId;
  final int quantity;
  final int duration;

  SiteDiaryDetailsWorkforce(this.typeId, this.quantity, this.duration);

}

class SiteDiaryDetailsEquipment {
  final String typeId;
  final int quantity;
  final int duration;

  SiteDiaryDetailsEquipment(this.typeId, this.quantity, this.duration);
}


extension SiteDiaryMapper on GetSingleSiteDiaryDetailsResponse {
  List<SiteDiaryDetailsTask> toTaskList() {
    if (tasks == null) return [];

    return tasks!.map((task) {
      final workforceList = task.workforces?.map((wf) {
        return SiteDiaryDetailsWorkforce(
          wf.workforce?.sId ?? "",
          (wf.quantity is int)
              ? wf.quantity
              : int.tryParse(wf.quantity.toString()) ?? 0,
          _parseDurationToInt(wf.duration),
        );
      }).toList() ?? [];

      final equipmentList = task.equipments?.map((eq) {
        return SiteDiaryDetailsEquipment(
          eq.equipment?.sId ?? "",
          (eq.quantity is int)
              ? eq.quantity
              : int.tryParse(eq.quantity.toString()) ?? 0,
          _parseDurationToInt(eq.duration),
        );
      }).toList() ?? [];

      return SiteDiaryDetailsTask(
        task.name ?? "",
        workforceList,
        equipmentList,
      );
    }).toList();
  }
}

int _parseDurationToInt(dynamic duration) {
  if (duration == null) return 0;
  if (duration is int) return duration;
  final str = duration.toString();
  final number = int.tryParse(str.split(" ").first);
  return number ?? 0;
}