import 'package:firebase_practice/base/base_vm.dart';
import 'package:firebase_practice/data/repositories/forgot/forgot_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ForgotVM extends BaseVM {
  ForgotRepo repo = GetIt.I.get<ForgotRepo>();
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void userData({required BuildContext context}) {
    String getEmail = emailController.text.trim();
    sendCode(context: context, email: getEmail);
  }

  Future<void> sendCode(
      {required BuildContext context, required String email}) async {
    isLoading = true;
    bool response = await repo.sendCode(context: context, email: email);
    isLoading = false;
  }
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
