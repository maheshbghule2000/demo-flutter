import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../models/product/product_model.dart';
import '../../services/api/api_endpoints.dart';
import '../../services/api/api_manager.dart';
import '../../utils/routes.dart';

class ProductController extends GetxController {
  void gotohomePage(BuildContext context) {
    context.go(Routes.splashRoute);
    refresh();
  }

  final _apiManager = ApiManager();
  int _currentPage = 1;
  int _limit = 5;
  List<ProductModel> _products = []; // List of products displayed on the screen
  bool _isLoading = false;
  bool _hasMore = true;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> getProducts() async {
    if (_isLoading || !_hasMore) return;

    try {
      _isLoading = true;
      var response = await _apiManager.get(ApiEndpoints.getAllProducts);
      var productList = (response['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();

      if (productList.isNotEmpty) {
        _products.addAll(productList);
        _currentPage++;
      } else {
        _hasMore = false;
      }
    } catch (error) {
      print("Error during the API request: $error");
    } finally {
      _isLoading = false;
      update(); // Notify the UI that the data has changed
    }
  }
}
