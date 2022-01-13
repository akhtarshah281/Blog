import 'package:firebase_practice/base/base_repo.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterRepo extends BaseRepo {
  Future<dynamic> saveUserData(
      {required BuildContext context,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String confirmPassword,
      });
 Future<dynamic> registerUser(
      {required BuildContext context,
      required String email,
      required String password});
}

