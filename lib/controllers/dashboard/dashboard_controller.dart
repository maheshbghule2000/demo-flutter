import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';

import '../../utils/routes.dart';

class DashboardController extends GetxController {
  void gotosplashRoute(BuildContext context) {
    context.go(Routes.splashRoute);
    refresh();
  }
}
