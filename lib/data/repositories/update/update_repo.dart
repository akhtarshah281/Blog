

import 'dart:io';

import 'package:firebase_practice/base/base_repo.dart';
import 'package:flutter/cupertino.dart';

abstract class UpdateRepo extends BaseRepo{
  Future<dynamic> updateData({required String firstName,required String lastName,
     required String? imageUrl
  });
  Future<dynamic> uplaodImage({required BuildContext context,required File file});
}