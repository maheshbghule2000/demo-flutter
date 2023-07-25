import 'package:get/get.dart';
import 'package:pagination_demo/models/post/post_model.dart';
import 'package:pagination_demo/services/post/post_service.dart';

class PostController extends GetxController {
  final PostRepository postRepository = PostRepository();
  PostResponseModel postResponseModel = PostResponseModel();
  final _isDataLoading = false.obs;
  bool get isDataLoading => _isDataLoading.value;
  final _errorMessage = " Data Not Found".obs;

  getAllPostList() async {
    _isDataLoading(true);
    var response = await postRepository.getPosts();

    response.fold((failure) {
      _errorMessage.value = failure.message;
      _isDataLoading(false);
    }, (data) async {
      postResponseModel = data;
      print(data);
      _isDataLoading(false);
      print(data);
    });
  }
}
