import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pagination_demo/consts/app_colors.dart';
import 'package:pagination_demo/controllers/post/post_controller.dart';
import 'package:pagination_demo/views/widgets/text_widget.dart';

class PostPaginationScreen extends StatefulWidget {
  const PostPaginationScreen({super.key});

  @override
  State<PostPaginationScreen> createState() => _PostPaginationScreenState();
}

final PostController _postController = Get.find();

class _PostPaginationScreenState extends State<PostPaginationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bodyColor,
        body: ListView.builder(
            itemCount: _postController.postResponseModel.userId,
            itemBuilder: (context, index) {
              return _postListWidget(context);
            }));
  }

  _postListWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 'userId'
            TextWidget(
                context: context,
                data: _postController.postResponseModel.userId.toString()),
            TextWidget(
                context: context,
                data: _postController.postResponseModel.id.toString()),
            TextWidget(
                context: context,
                data: _postController.postResponseModel.title.toString()),
            TextWidget(
                context: context,
                data: _postController.postResponseModel.body.toString()),
          ],
        ),
      ),
    );
  }
}
