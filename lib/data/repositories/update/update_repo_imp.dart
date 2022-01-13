

import 'dart:io';

import 'package:firebase_practice/data/repositories/update/update_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateRepoImp extends UpdateRepo{
  @override
  Future updateData({required String firstName, required String lastName,
    String ?  imageUrl
  }) async{
    return await apiClient.updateData(firstName: firstName, lastName: lastName,
        imageUrl: imageUrl
    );
  }

  @override
  Future uplaodImage({required BuildContext context,required File file}) {
    return apiClient.uplaodImage(context: context,imageFile: file);
  }
}