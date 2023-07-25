import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_demo/utils/app_utils.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';

class TextWidget extends GetResponsiveView {
  TextWidget(
      {Key? key,
      required this.context,
      required this.data,
      this.fontWeight = FontWeight.normal,
      this.fontSize = AppSizes.smallTextSize, // =15
      this.textAlign = TextAlign.start,
      this.height,
      this.textScaleFactor,
      this.color,
      this.textOverflow = TextOverflow.clip,
      this.isMandatory = false,
      this.trimLongText,
      this.maxLines})
      : super(key: key);

  final BuildContext context;
  final String data;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final Color? color;
  final bool isMandatory;
  final double? height;
  final TextOverflow textOverflow;
  final double? textScaleFactor;
  final int? maxLines;

  final bool? trimLongText;

  @override
  Widget? builder() {
    return Tooltip(
        message: trimLongText == true ? data : "",
        child: RichText(
          maxLines: maxLines ?? 1,
          textAlign: textAlign,
          overflow: textOverflow,
          textScaleFactor: textScaleFactor ?? 1,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: trimLongText == true ? data.truncateTo(50) : data,
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  color: color ?? AppColors.blackColor,
                  fontWeight: fontWeight,
                  fontSize: AppSizes.getPhoneSize(fontSize),
                  height:
                      height != null ? AppSizes.getPhoneSize(height!) : height,
                ),
              ),
              isMandatory
                  ? TextSpan(
                      text: " *",
                      style: TextStyle(
                        fontFamily: 'Kumbh Sans',
                        color: AppColors.blackColor,
                        fontWeight: fontWeight,
                        fontSize: AppSizes.getPhoneSize(fontSize),
                        height: height != null
                            ? AppSizes.getPhoneSize(height!)
                            : height,
                      ),
                    )
                  : const TextSpan(),
            ],
          ),
        ));
  }
}















// class TextWidget extends GetResponsiveView {
//   TextWidget(
//       {Key? key,
//       required this.context,
//       required this.data,
//       this.fontWeight = FontWeight.normal,
//       this.fontSize = AppSizes.smallTextSize,
//       this.textAlign = TextAlign.start,
//       this.height,
//       this.textScaleFactor,
//       this.color,
//       this.textOverflow = TextOverflow.clip,
//       this.isMandatory = false,
//       this.trimLongText,
//       this.maxLines})
//       : super(key: key);

//   final BuildContext context;
//   final String data;
//   final FontWeight fontWeight;
//   final double fontSize;
//   final TextAlign textAlign;
//   final Color? color;
//   final bool isMandatory;
//   final double? height;
//   final TextOverflow textOverflow;
//   final double? textScaleFactor;
//   final int? maxLines;

//   /// Trim the long text to 50 chars text follwed by ...
//   final bool? trimLongText;

//   @override
//   Widget? builder() {
//     return Tooltip(
//         message: trimLongText == true ? data : "",
//         child: RichText(
//           maxLines: maxLines ?? 1,
//           textAlign: textAlign,
//           overflow: textOverflow,
//           textScaleFactor: textScaleFactor ?? 1,
//           text: TextSpan(
//             children: <TextSpan>[
//               TextSpan(
//                 text: trimLongText == true ? data.truncateTo(50) : data,
//                 style: GoogleFonts.baiJamjuree(
//                   color: color ?? AppColors.blackColor,
//                   fontWeight: fontWeight,
//                   fontSize: fontSize.sp,
                  
//                   // screen.isPhone
//                   //     ? AppSizes.getPhoneSize(fontSize)
//                   //     : AppSizes.getWebSize(fontSize),
//                   height: height != null ? height!.h : height,
//                 ),
                
//               ),
//               isMandatory
//                   ? TextSpan(
//                       text: "*",
//                       style: GoogleFonts.baiJamjuree(
//                         color: AppColors.red,
//                         fontWeight: fontWeight,
//                         fontSize: fontSize.sp,
                        
//                         // screen.isPhone
//                         //     ? AppSizes.getPhoneSize(fontSize)
//                         //     : AppSizes.getWebSize(fontSize),
//                         height: height != null
//                             ? height!.h
//                             // screen.isPhone
//                             //         ? AppSizes.getPhoneSize(height!)
//                             //         : AppSizes.getWebSize(height!)
//                             : height,
//                       ),
//                     )
//                   : const TextSpan(),
//             ],
//           ),
//         ));
//   }
// }
