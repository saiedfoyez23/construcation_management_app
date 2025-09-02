import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/asphalt_volume_and_tonne_calculator_view.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/concrete_volume_calculator_view.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/load_estimator_view.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/pipe_bedding_trench_fill_calculator_view.dart';
import 'package:construction_management_app/modules/company_user/calculator_tools/view/stone_calculator_view.dart';
import 'package:construction_management_app/modules/company_user/project_details/view/project_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorView extends StatelessWidget {
  CalculatorView({super.key,required this.projectId});

  final String projectId;
  final List<String> calculators = [
    'Concrete Volume Calculator',
    'Asphalt volume + Tonne calculator',
    'Stone Calculator',
    'Pipe Bedding / Trench Fill Calculator',
    'Load Estimator',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [
        
        
              CustomAppBarHelper.normalAppBar(
                context: context,
                height: 70,
                onBackPressed: () {
                  Get.off(()=>ProjectDetailsView(projectId: projectId),preventDuplicates: false);
                },
                title: "Tools",
              ),
        
              SliverToBoxAdapter(
                child: Container(
                  height: 812.h(context),
                  width: 375.w(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r(context)),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                  child: ListView.builder(
                    itemCount: calculators.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          if(index == 0) {
                            Get.off(()=>ConcreteVolumeCalculatorView(projectId: projectId,),preventDuplicates: false);
                          } else if(index == 1) {
                            Get.off(()=>AsphaltVolumeAndTonneCalculatorView(projectId: projectId),preventDuplicates: false);
                          } else if(index == 2) {
                            Get.off(()=>StoneCalculatorView(projectId: projectId),preventDuplicates: false);
                          } else if(index == 3) {
                            Get.off(()=>PipeBeddingTrenchFillCalculatorView(projectId: projectId),preventDuplicates: false);
                          } else if(index == 4) {
                            Get.off(()=>LoadEstimatorView(projectId: projectId),preventDuplicates: false);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.bpm(context)),
                          width: 375.w(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r(context)),
                            color: Color.fromRGBO(249, 250, 251, 1), // rgba(249, 250, 251, 1)
                          ),
                          padding: EdgeInsets.fromLTRB(
                            12.lpm(context),
                            9.tpm(context),
                            12.rpm(context),
                            9.bpm(context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextHelperClass.headingText(
                                  context: context,
                                  text: calculators[index],
                                  fontSize: 22,
                                  textColor: Color.fromRGBO(35, 47, 48, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Color.fromRGBO(75, 85, 99, 1),
                                size: 24.r(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
