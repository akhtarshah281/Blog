import 'package:firebase_practice/data/api_client.dart';
import 'package:firebase_practice/data/repositories/profile/profile_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileRepoImp extends ProfileRepo{
  @override
  Future getUserData() {
    return apiClient.getUserData();
  }


}