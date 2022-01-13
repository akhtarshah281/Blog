import 'package:firebase_practice/data/repositories/register/register_repo.dart';
import 'package:flutter/cupertino.dart';

class RegisterRepoImp extends RegisterRepo {
  @override
  Future saveUserData(
      {required BuildContext context,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String confirmPassword}) async {
    return await apiClient.saveUserData(
        context: context,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        confirmPassword: confirmPassword,
    );
  }

  @override
  Future registerUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    return await apiClient.registerUser(
        context: context, email: email, password: password);
  }
}
