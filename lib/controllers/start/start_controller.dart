import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../utils/routes.dart';

class StartController extends GetxController {
  void gotoPostsPage(BuildContext context) {
    context.go(Routes.postRoute);
    refresh();
  }
  void gotoproductPage(BuildContext context) {
    context.go(Routes.productRoute);
    refresh();
  }
}
