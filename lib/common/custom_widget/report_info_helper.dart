import 'package:flutter/material.dart';
import '../common.dart';

class ReportInfoHelper {

  static Widget projectInfoRow({
    required BuildContext context,
    required String label,
    required String value,
    double labelFontSize = 16,
    double valueFontSize = 16,
    Color labelColor = const Color.fromRGBO(75, 85, 99, 1),
    Color valueColor = const Color.fromRGBO(173, 174, 188, 1),
    FontWeight labelFontWeight = FontWeight.w500,
    FontWeight valueFontWeight = FontWeight.w500,
    double horizontalSpace = 7,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Expanded(
          child: TextHelperClass.headingText(
            context: context,
            text: label,
            fontSize: labelFontSize,
            textColor: labelColor,
            fontWeight: labelFontWeight,
          ),
        ),

        SpaceHelperClass.h(horizontalSpace.w(context)),

        Expanded(
          child: TextHelperClass.headingText(
            context: context,
            text: value,
            fontSize: valueFontSize,
            textColor: valueColor,
            fontWeight: valueFontWeight,
          ),
        ),
      ],
    );
  }




}