import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pagination_demo/models/post/post_model.dart';
import '../../utils/failure.dart';
import '../api/api_endpoints.dart';
import '../api/api_exception.dart';
import '../api/api_manager.dart';

class PostRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, PostResponseModel>> getPosts() async {
    try {
      // var jsonResponse = await _apiManager.get(ApiEndpoints.getAllPosts);
      var jsonResponse =
          await _apiManager.get('https://jsonplaceholder.typicode.com/post');
      print('https://jsonplaceholder.typicode.com/post');
      print('ewrwerew');
      var response = PostResponseModel.fromJson(jsonResponse);

      log(response.toString());
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, PostResponseModel>> getProduct() async {
    try {
      // var jsonResponse = await _apiManager.get(ApiEndpoints.getAllPosts);
      var jsonResponse = await _apiManager.get(ApiEndpoints.getAllProducts);

      var response = PostResponseModel.fromJson(jsonResponse);

      log(response.toString());
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
