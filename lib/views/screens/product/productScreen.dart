import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../consts/app_colors.dart';
import '../../../controllers/product/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Demo'),
      ),
      backgroundColor: AppColors.bodyColor,
      body: Obx(
        () {
          return ListView.builder(
            itemCount: _productController.hasMore
                ? _productController.products.length + 1
                : _productController.products.length,
            itemBuilder: (context, index) {
              if (index >= _productController.products.length) {
                // Display a loading indicator at the end of the list while fetching more data
                if (_productController.hasMore) {
                  _productController.getProducts(); // Fetch more products
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.grayColor,
                    ),
                  );
                } else {
                  return Container(); // No more data to load, return an empty container
                }
              } else {
                // Display product item
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_productController
                          .products[index].products
                          .toString()),
                    ),
                    // title: Text(
                    //   _productController.products[index].title.t,
                    // ),
                    // subtitle: Text(
                    //   _productController.products[index].description,
                    // ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
