import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pagination_demo/consts/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_demo/controllers/product/product_controller.dart';
import 'package:pagination_demo/services/api/api_endpoints.dart';
import 'package:pagination_demo/views/widgets/text_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ScrollController _scrollController = ScrollController();

  // ProductControllerr _productController = ProductControllerr();
  List products = [];
  int skip = 1;
  int limit = 5;
  bool loadMore = false;
  fetchProducts() async {
    var url = Uri.parse(ApiEndpoints.getAllProducts);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body)['products'] as List;

      setState(() {
        products.addAll(json);
      });
    }
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          loadMore = true;
        });
        skip = skip + limit;
        await fetchProducts();
        setState(() {
          loadMore = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Demo'),
      ),
      backgroundColor: AppColors.bodyColor,
      body: ListView.builder(
          itemCount: loadMore ? products.length + 1 : products.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index >= products.length) {
              return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: AppColors.grayColor),
              );
            } else {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(products[index]['thumbnail']),
                  ),
                  title: TextWidget(
                      context: context, data: products[index]['title']),
                  subtitle: TextWidget(
                      context: context, data: products[index]['description']),
                ),
              );
            }
          }),
    );
  }
}
