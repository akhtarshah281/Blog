import 'package:firebase_practice/base/base_repo.dart';
import 'package:flutter/cupertino.dart';

abstract class ProfileRepo extends BaseRepo {
  Future<dynamic> getUserData();
}
