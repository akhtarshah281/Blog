
import 'package:flutter/src/widgets/framework.dart';

import 'login_repo.dart';

class LoginRepoImp extends LoginRepo {
  @override
  Future loginUser({required BuildContext context, required String email, required String password}) async{
    return await apiClient.loginUser(context: context, email: email, password: password);
  }

}
