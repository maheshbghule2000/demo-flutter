import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pagination_demo/controllers/dashboard/dashboard_controller.dart';
import 'package:pagination_demo/controllers/post/post_controller.dart';
import 'package:pagination_demo/controllers/product/product_controller.dart';
import 'package:pagination_demo/controllers/start/start_controller.dart';

void initialBinding() {
  Get.lazyPut<StartController>(() => StartController());
  Get.lazyPut<PostController>(() => PostController());
  Get.lazyPut<ProductController>(() => ProductController());
  Get.lazyPut<DashboardController>(() => DashboardController());
}
