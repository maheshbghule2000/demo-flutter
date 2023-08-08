import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pagination_demo/controllers/dashboard/dashboard_controller.dart';
import 'package:pagination_demo/views/screens/start/splash_screen.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_sizes.dart';
import '../../../consts/app_strings.dart';
import '../../../controllers/start/start_controller.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/material_text_form_field.dart';
import '../../widgets/sized_box_widget.dart';
import '../../widgets/text_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final StartController _startController = Get.find();
final DashboardController _dashboardController = Get.find();

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bodyColor,
      body: _HomeSection(),
      bottomNavigationBar: _BottomTabs(),
    ));
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
}

class _BottomTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0, // Set the default selected index
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        // Implement navigation logic here
        // For example, using Navigator.push or Navigator.pushReplacement
      },
    );
  }
}

class _HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _getStorageData(),
        _HorizontalImageList(),
        _VerticalImageList(),
        _GridImageList(),
        SizedBox(height: 20),
        CustomButtonWidget(
          borderRadius: 50,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: AppColors.lightWhiteColor,
          context: context,
          data: 'Logout',
          onClick: () {
            _dashboardController.gotosplashRoute(context);
          },
        ),
      ],
    );
  }
}

class _HorizontalImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          // Replace with your image URL or image widget
          return Container(
            margin: EdgeInsets.all(8),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1691424024432-c3dac1b74ab2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=872&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _getStorageData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                fontSize: 15,
                context: context,
                data: 'Login Data',
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                  fontSize: 15,
                  context: context,
                  data: 'Email: ${GetStorage().read('email')}'),
              TextWidget(
                  fontSize: 15,
                  context: context,
                  data: 'Password: ${GetStorage().read('password')}'),
              SizedBoxWidget(
                height: 10,
              ),
              TextWidget(
                fontSize: 15,
                context: context,
                data: 'Sign-Up Data',
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                  fontSize: 15,
                  context: context,
                  data: 'Name: ${GetStorage().read('Name')}'),
              TextWidget(
                  fontSize: 15,
                  context: context,
                  data: 'Email: ${GetStorage().read('Email')}'),
              TextWidget(
                  fontSize: 15,
                  context: context,
                  data: 'Password: ${GetStorage().read('Password')}'),
              SizedBoxWidget(
                height: 10,
              ),
              CustomButtonWidget(
                borderRadius: 40,
                width: 100,
                height: 35,
                fontSize: 15,
                color: AppColors.lightWhiteColor,
                context: context,
                data: 'Clear Data',
                onClick: () {
                  GetStorage().erase();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class _VerticalImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (index) {
          // Replace with your image URL or image widget
          return Container(
            margin: EdgeInsets.all(8),
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1691348418208-0174389a1996?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=386&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GridImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        // Replace with your image URL or image widget
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1682685797507-d44d838b0ac7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
