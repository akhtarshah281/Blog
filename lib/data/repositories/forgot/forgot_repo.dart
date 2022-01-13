import 'package:firebase_practice/base/base_repo.dart';
import 'package:flutter/cupertino.dart';

abstract class ForgotRepo extends BaseRepo{

  Future<bool> sendCode({required BuildContext context,required String email});

}