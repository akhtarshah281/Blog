import 'dart:io';

import 'package:firebase_practice/base/base_vm.dart';
import 'package:firebase_practice/data/local_db/entities/posts_entity.dart';
import 'package:firebase_practice/data/repositories/add_post/add_post_repo.dart';
import 'package:firebase_practice/ui/home/home_screen.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddPostVM extends BaseVM {
  AddPostRepo repo = GetIt.I.get<AddPostRepo>();
  List<Posts> offlinePosts = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  addPost({required BuildContext context, required File file}) async {
    String getTitle = titleController.text.trim();
    String getDesc = titleController.text.trim();
    if (getTitle.isEmpty) {
      Utils.showSnackbar(context: context, mesg: 'title is Empty!');
    }
    if (getDesc.isEmpty) {
      Utils.showSnackbar(context: context, mesg: 'plz Add Some Description!');
    } else {
      String? url = await uploadPostImage(context: context, file: file);
      await addPostData(
          context: context,
          title: getTitle,
          description: getDesc,
          postImageUrl: url);
    }
  }

  Future<void> addPostData(
      {required BuildContext context,
      required String title,
      required String description,
      required String? postImageUrl}) async {
    isLoading = true;
    await repo.addPostData(
        context: context,
        title: title,
        description: description,
        ImageUrl: postImageUrl);
    Utils.nextScreen(context: context, screenRouteName: HomeScreen.routeName);
    isLoading = false;
  }

  Future<String> uploadPostImage(
      {required BuildContext context, required File file}) async {
    isLoading = true;
    String url = await repo.uploadPostsImage(context: context, file: file);
    isLoading = false;
    return url;
  }
}
