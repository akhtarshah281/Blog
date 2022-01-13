import 'package:firebase_practice/data/repositories/forgot/forgot_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotRepoImp extends ForgotRepo{
  @override
  Future<bool> sendCode({required BuildContext context, required String email}) async {
    return await apiClient.sendCode(context: context, email: email);

  }

}