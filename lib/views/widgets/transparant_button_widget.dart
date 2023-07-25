
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

// ignore: must_be_immutable
class TransparentButton extends GetResponsiveView {
  TransparentButton({
    Key? key,
    required this.context,
    required this.data,
    required this.onPressed,
    this.color,
    this.borderradius = 32,
    this.width = 106,
    this.height = 42,
    this.letterSpacing = 0,
    this.background,
    this.fontSize = AppSizes.smallTextSize,
  }) : super(key: key);

  final BuildContext context;
  final String data;
  final Color? color;
  final double borderradius;
  final double width;
  final double height;
  final double letterSpacing;
  final Color? background;
  final double fontSize;
  void Function()? onPressed;

  @override
  Widget? builder() {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.all(AppSizes.getPhoneSize(0))),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
              background ?? AppColors.lightWhiteColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderradius.w),
              side: BorderSide(color: color ?? AppColors.blackColor),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          data,
          softWrap: false,
          style: TextStyle(
            fontFamily: 'Kumbh Sans',
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w600,
            color: color ?? AppColors.blackColor,
            letterSpacing: letterSpacing.w,
          ),
        ),
      ),
    );
  }
}
