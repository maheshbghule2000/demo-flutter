import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:pagination_demo/views/widgets/text_widget.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import 'circular_progress_indicator_widget.dart';

class CustomButtonWidget extends GetResponsiveView {
  CustomButtonWidget({
    Key? key,
    required this.context,
    required this.data,
    this.width = 110,
    this.height = 40,
    required this.onClick,
    this.isInProgress = false,
    this.borderRadius = 0,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.backgroundColor = AppColors.blackColor,
    this.color = AppColors.blackColor,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final double height;
  final String data;
  final Function onClick;
  final bool isInProgress;
  final FontWeight fontWeight;
  final double fontSize;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget? builder() {
    return InkWell(
      borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.getPhoneSize(borderRadius))),
      onTap: () {
        if (!isInProgress) {
          onClick();
        }
      },
      child: Container(
        width: AppSizes.getPhoneSize(width),
        height: AppSizes.getPhoneSize(height),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
              AppSizes.getPhoneSize(borderRadius),
            )),
            color: backgroundColor),
        child: isInProgress
            ? CircularProgressIndicatorWidget(
                context: context, size: 20, color: AppColors.containerColor)
            : TextWidget(
                context: context,
                data: data,
                textAlign: TextAlign.center,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
      ),
    );
  }
}
