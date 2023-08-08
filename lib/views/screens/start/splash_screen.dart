import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pagination_demo/views/screens/sign_in/sign_in.dart';
import 'package:pagination_demo/views/screens/sign_up/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_sizes.dart';
import '../../../consts/app_strings.dart';
import '../../../controllers/start/start_controller.dart';
import '../../widgets/sized_box_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/transparant_button_widget.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final StartController _startController = Get.find();
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2), () {
        SignUpScreen();
      });
    });
    super.initState();
  }

  late String FinalEmail; // FinalEmail remains non-nullable

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      FinalEmail = obtainedEmail ?? '';
      print(FinalEmail); // Use null-aware assignment with a default value
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bodyColor,
        body: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Stack(
            children: [
              // _gridViewTopMost(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxWidget(height: 20),
                  _nameWidget(context),
                  const Spacer(),
                  _middleTextWidget(context),
                  const Spacer(),
                  _bottomWidget(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _nameWidget(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            context: context,
            data: "Welcome",
            color: AppColors.blackColor,
            fontSize: 18.sp,
          ),
          SizedBoxWidget(
            height: 10,
          ),
          TextWidget(
            context: context,
            data: AppStrings.name,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ]);
  }

  _middleTextWidget(context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.synkrama,
            style: GoogleFonts.baiJamjuree(
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
              fontSize: 35.sp,
            ),
          ),
          Text(
            AppStrings.technologies,
            style: GoogleFonts.baiJamjuree(
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
              fontSize: 35.sp,
            ),
          ),
          SizedBoxWidget(
            height: 30.h,
          ),
          TransparentButton(
            context: context,
            data: 'Start Now',
            fontSize: 20,
            width: 140,
            height: 40,
            onPressed: () {
              _startController.gotoSignInPage(context);
            },
          ),
        ],
      ),
    );
  }

  _bottomWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextWidget(
            context: context,
            data: 'poweredBy',
            color: AppColors.lightDarkColor,
            fontSize: AppSizes.bodyLargeTextSizePhone.sp,
          ),
          const SizedBoxWidget(
            height: 10,
          ),
          TextWidget(
            context: context,
            data: 'Synkrama Technologies',
            color: AppColors.blackColor,
            fontSize: AppSizes.bodyLargeTextSizePhone.sp,
          ),
        ],
      ),
    );
  }
}
