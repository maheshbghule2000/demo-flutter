import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_sizes.dart';
import '../../../consts/app_strings.dart';
import '../../../controllers/start/start_controller.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/material_text_form_field.dart';
import '../../widgets/sized_box_widget.dart';
import '../../widgets/text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final StartController _startController = Get.find();
TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.bodyColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nameWidget(
                  context,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppSizes.getPhoneSize(38),
                        right: AppSizes.getPhoneSize(19)),
                    child: Column(
                      children: [
                        _textAndTextField(context),
                        SizedBoxWidget(
                          height: 100,
                        ),
                        _sendOtpScreen(context, _formKey)
                        // _loginAccountWidget(context),
                      ],
                    ),
                  ),
                ),
                _bottomWidget(context),
              ],
            )));
  }

  _bottomWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // _dividerWidget(context),
          TextWidget(
            context: context,
            data: AppStrings.poweredBy,
            color: AppColors.lightDarkColor,
            fontSize: AppSizes.bodyLargeTextSizePhone.sp,
          ),
          SizedBoxWidget(
            height: 5,
          ),
          TextWidget(
            context: context,
            data: AppStrings.companyname,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontSize: AppSizes.bodyLargeTextSizePhone.sp,
          ),
        ],
      ),
    );
  }

  _nameWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 20.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              context: context,
              data: AppStrings.welcome,
              color: AppColors.lightDarkColor,
              fontSize: 18.sp,
            ),
            SizedBoxWidget(
              height: 5,
            ),
            TextWidget(
              context: context,
              data: AppStrings.name,
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ]),
    );
  }

  _sendOtpScreen(BuildContext context, GlobalKey<FormState> formKey) {
    return Column(
      children: [
        CustomButtonWidget(
          borderRadius: 50,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: AppColors.lightWhiteColor,
          context: context,
          data: 'Sign Up',
          onClick: () {
            GetStorage().write('Email', _emailController.text);
            GetStorage().write('Password', _passwordController.text);
            GetStorage().write('Name', _nameController.text);

            _startController.gotoDashboard(context);
          },
        ),
        SizedBoxWidget(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  _startController.gotoSignInPage(context);
                },
                child: TextWidget(
                  context: context,
                  data: 'Already have an account?',
                  fontSize: 15,
                  color: AppColors.grayColor,
                )),
            GestureDetector(
              onTap: () {
                // Navigate to the forgot password screen here
              },
              child: TextWidget(
                context: context,
                data: 'Forgot password?',
                fontSize: 15,
                color: AppColors.grayColor,
              ),
            ),
          ],
        ),
        const SizedBoxWidget(height: 30),
      ],
    );
  }

  _textAndTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _loginAccountWidget(context),
        const SizedBoxWidget(
          height: 15,
        ),
        _userNameWidget(context),
        const SizedBoxWidget(
          height: 15,
        ),
        _emailWidget(context),
        const SizedBoxWidget(
          height: 15,
        ),
        _passwordWidget(context),
        const SizedBoxWidget(
          height: 15,
        ),
        __conformpasswordwidget(context),
      ],
    );
  }

  _userNameWidget(BuildContext context) {
    return MaterialTextFormFieldWidget(
      textEditingController: _nameController,
      context: context,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        } else {
          // Check if the name contains digits
          if (value.contains(RegExp(r'\d'))) {
            return 'Name should not contain digits';
          }

          // Check if the name contains special characters
          if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            return 'Name should not contain special characters';
          }
        }
        return null;
      },
      hintText: 'Enter your name',
      hintColor: AppColors.grayColor,
    );
  }

  _emailWidget(BuildContext context) {
    return MaterialTextFormFieldWidget(
      textEditingController: _emailController,
      context: context,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        } else {
          String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
          RegExp regExp = RegExp(pattern);
          if (!regExp.hasMatch(value)) {
            return 'Enter a valid email';
          }
        }
        return null;
      },
      hintText: 'Enter your email',
      hintColor: AppColors.grayColor,
    );
  }

// _passwordWidget
  _passwordWidget(BuildContext context) {
    return MaterialTextFormFieldWidget(
      textEditingController: _passwordController,
      context: context,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        } else if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Password must contain at least 1 uppercase letter';
        } else if (!value.contains(RegExp(r'[a-z]'))) {
          return 'Password must contain at least 1 lowercase letter';
        } else if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must contain at least 1 digit';
        } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          return 'Password must contain at least 1 special character';
        }
        return null;
      },
      hintText: 'Enter your password',
      hintColor: AppColors.grayColor,
    );
  }

// __conformpasswordwidget
  __conformpasswordwidget(BuildContext context) {
    return MaterialTextFormFieldWidget(
      textEditingController: _confirmPasswordController,
      context: context,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Confirm Password is required';
        } else if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      obscureText: true,
      hintText: 'Confirm your password',
      hintColor: AppColors.grayColor,
    );
  }

  _loginAccountWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          context: context,
          data: 'Lets Get Started..',
          color: AppColors.blackColor,
          fontSize: AppSizes.getPhoneSize(25),
        ),
        SizedBoxWidget(
          height: 20,
        ),
      ],
    );
  }
}
