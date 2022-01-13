import 'package:firebase_practice/base/base_repo.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginRepo extends BaseRepo {

  Future<dynamic> loginUser({required BuildContext context,required String email, required String password});

}