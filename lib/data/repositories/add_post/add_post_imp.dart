import 'dart:io';
import 'package:firebase_practice/data/repositories/add_post/add_post_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPostImp extends AddPostRepo{

  @override
  Future uploadPostsImage({required BuildContext context, required File file}) {
   return apiClient.uploadPostImage(context: context, postfile: file);
  }

  @override
  Future addPostData({required BuildContext context, required String title, required String description, required String? ImageUrl}) {
    return apiClient.savePostsData(context: context, title: title, desc: description);
  }
}