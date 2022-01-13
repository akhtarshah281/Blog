import 'package:firebase_practice/base/base_vm.dart';
import 'package:firebase_practice/data/repositories/login/login_repo.dart';
import 'package:firebase_practice/ui/home/home_screen.dart';
import 'package:firebase_practice/ui/profile/profile_screen.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:validators/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginVM extends BaseVM {
  LoginRepo loginRepo = GetIt.I.get<LoginRepo>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void validateUser({required BuildContext context}) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty) {
      Utils.showSnackbar(context: context, mesg: "Email can't be Empty");
      return;
    } else if (!isEmail(email)) {
      Utils.showSnackbar(context: context, mesg: "Enter a Valid Email");
      return;
    } else if (password.isEmpty) {
      Utils.showSnackbar(context: context, mesg: "Password can't be Empty");
      return;
    } else {
      loginUser(context: context, email: email, password: password);
    }
  }

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    dynamic response = await loginRepo.loginUser(
        context: context, email: email, password: password);
    if (response is UserCredential) {
       Utils.nextScreen(context: context, screenRouteName: HomeScreen.routeName);
      isLoading = false;
    }
    else{
      isLoading = false;
    }

  }
}
