import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:pagination_demo/views/widgets/sized_box_widget.dart';

class CircularProgressIndicatorWidget extends GetResponsiveView {
  CircularProgressIndicatorWidget({
    Key? key,
    required this.context,
    this.size = 30,
    this.strokeWidth = 2,
    this.color,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final BuildContext context;
  final double size;
  final double strokeWidth;
  final Color? color;
  final Alignment alignment;

  @override
  Widget? builder() {
    return Align(
      alignment: alignment,
      child: SizedBoxWidget(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth.w,
          // screen.isPhone
          //     ? AppSizes.getPhoneSize(strokeWidth)
          //     : AppSizes.getWebSize(strokeWidth),
          valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
