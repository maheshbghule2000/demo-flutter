import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_sizes.dart';
import '../../../consts/app_strings.dart';
import '../../../controllers/start/start_controller.dart';
import '../../../utils/shared_preferenc.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/material_text_form_field.dart';
import '../../widgets/sized_box_widget.dart';
import '../../widgets/text_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final StartController _startController = Get.find();

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
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
                        __signInButton(context, _formKey)
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

  __signInButton(BuildContext context, GlobalKey<FormState> formKey) {
    return Column(
      children: [
        CustomButtonWidget(
          borderRadius: 50,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: AppColors.lightWhiteColor,
          context: context,
          data: 'Sign In',
          onClick: () async {
            GetStorage().write('email', _emailController.text);
            GetStorage().write('password', _passwordController.text);
            // final  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            _startController.gotoDashboard(context);
            // sharedPreferences.setString('email', _emailController.text);
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
                  _startController.gotoSignUpPage(context);
                },
                child: TextWidget(
                  context: context,
                  data: 'Create an account',
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
        TextWidget(
          context: context,
          data: 'Or sign in with',
          fontSize: 20,
        ),
        const SizedBoxWidget(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(
              borderRadius: 50,
              width: 150,
              height: 40,
              backgroundColor: AppColors.bluecolor,
              color: AppColors.lightWhiteColor,
              context: context,
              data: 'FaceBook',
              onClick: () {},
            ),
            SizedBox(width: 16),
            CustomButtonWidget(
              borderRadius: 50,
              width: 150,
              height: 40,
              backgroundColor: AppColors.red,
              color: AppColors.lightWhiteColor,
              context: context,
              data: 'Google',
              onClick: () {},
            ),
          ],
        ),
      ],
    );
  }

  _textAndTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _loginAccountWidget(context),
        const SizedBoxWidget(
          height: 5,
        ),
        _emailWidget(context),
        SizedBoxWidget(
          height: 10,
        ),
        _passwordWidget(context)
      ],
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

  _passwordWidget(BuildContext context) {
    return MaterialTextFormFieldWidget(
      textEditingController: _passwordController,
      context: context,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        } else {
          // Password must be at least 8 characters long
          if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }

          // Password must contain at least 1 uppercase letter
          if (!value.contains(RegExp(r'[A-Z]'))) {
            return 'Password at least 1 uppercase letter';
          }

          // Password must contain at least 1 lowercase letter
          if (!value.contains(RegExp(r'[a-z]'))) {
            return 'Password at least 1 lowercase letter';
          }

          // Password must contain at least 1 digit
          if (!value.contains(RegExp(r'[0-9]'))) {
            return 'Password at least 1 digit';
          }

          // Password must contain at least 1 special character
          if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            return 'Password at least 1 special character';
          }
        }
        return null;
      },
      hintText: 'Enter your password',
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
          data: 'Please sign in to continue...',
          color: AppColors.blackColor,
          fontSize: 20,
        ),
        SizedBoxWidget(
          height: 10,
        ),
      ],
    );
  }
}
