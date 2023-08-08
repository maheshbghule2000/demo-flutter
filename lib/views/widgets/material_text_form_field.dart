import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import 'text_widget.dart';

// ignore: must_be_immutable
class MaterialTextFormFieldWidget extends GetResponsiveView {
  MaterialTextFormFieldWidget(
      {Key? key,
      required this.context,
      this.formFieldKey,
      this.contentPadding,
      this.textEditingController,
      this.initialValue,
      this.style,
      this.labelText = "",
      this.data = "",
      this.hintText = "",
      this.obscureText = false,
      this.readOnly = false,
      this.suffixIcon,
      this.onSuffixIconClick,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 20,
      this.textFontSize = 25,
      this.validator,
      this.maxLines = 1,
      this.isMandatory = false,
      this.isTextVisible = false,
      this.autoFocus = false,
      this.inputFormatter,
      this.onSubmit,
      this.onChanged,
      this.focusNode,
      this.hintColor,
      this.borderColor,
      this.image,
      this.onTap})
      : super(key: key);

  final BuildContext context;
  final GlobalKey<FormState>? formFieldKey;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final TextStyle? style;
  final bool obscureText;
  final String labelText;
  final String? data;
  final String hintText;
  final bool readOnly;
  final String? suffixIcon;
  final Function? onSuffixIconClick;
  final FontWeight fontWeight;
  final double fontSize;
  final double textFontSize;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final bool isMandatory;
  final bool isTextVisible;
  final bool autoFocus;
  void Function(String)? onChanged;
  void Function(String)? onSubmit;
  final List<TextInputFormatter>? inputFormatter;
  void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? hintColor;
  final Image? image;
  

  @override
  Widget? builder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTextVisible
            ? TextWidget(
                context: context,
                data: data ?? "",
                color: AppColors.grayColor,
                fontSize: textFontSize,
              )
            : const SizedBox(),
        // SizedBox(
        //   height: AppSizes.getPhoneSize(10),
        // ),
        Form(
          key: formFieldKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            focusNode: focusNode,
            onFieldSubmitted: onSubmit,
            autofocus: autoFocus,
            inputFormatters: inputFormatter,
            controller: textEditingController,
            initialValue: initialValue,
            readOnly: readOnly,
            onChanged: onChanged,
            maxLines: maxLines,
            // keyboardType: isPhone ?? false ? TextInputType.phone : null,
            obscureText: obscureText,
            textAlignVertical: TextAlignVertical.center,
            cursorWidth: AppSizes.getPhoneSize(1),
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: AppSizes.getPhoneSize(5)),
                      child: image
                      // ??
                      // IconWidget(
                      //   context: context,
                      //   data: suffixIcon!,
                      //   width: 100,
                      //   height: 100,
                      //   color: AppColors.blackColor,
                      //   onClick: () {
                      //     if (onSuffixIconClick != null) {
                      //       onSuffixIconClick!();
                      //     }
                      //   },
                      // ),
                      )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
              contentPadding: contentPadding,
              isDense: true,
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: TextStyle(
                fontFamily: 'Kumbh Sans',
                color: hintColor ?? AppColors.blackColor,
                // readOnly
                //     ? AppColors.blackColor.withOpacity(0.40)
                //     : AppColors.blackColor,
                fontWeight: fontWeight,
                fontSize: AppSizes.getPhoneSize(fontSize),
              ),
              // alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: AppSizes.getPhoneSize(2),
                  color: borderColor ?? AppColors.dividerColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: AppSizes.getPhoneSize(2),
                  color: borderColor ?? AppColors.dividerColor,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: AppSizes.getPhoneSize(2),
                  color: AppColors.grayColor,
                ),
              ),

              label: TextWidget(
                context: context,
                data: labelText,
                fontSize: fontSize,
                height: 0.1,
                isMandatory: isMandatory,
              ),
              errorStyle: TextStyle(
                fontFamily: 'Kumbh Sans',
                color: Theme.of(context).errorColor,
                fontWeight: FontWeight.normal,
                fontSize: AppSizes.getPhoneSize(fontSize),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Kumbh Sans',
              color: readOnly ? AppColors.whiteColor : AppColors.blackColor,
              fontWeight: fontWeight,
              fontSize: AppSizes.getPhoneSize(fontSize),
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
