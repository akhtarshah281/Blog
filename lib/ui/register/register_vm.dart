import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/base/base_vm.dart';
import 'package:firebase_practice/data/repositories/register/register_repo.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:validators/validators.dart';

class RegisterVM extends BaseVM {
  RegisterRepo repo = GetIt.I.get<RegisterRepo>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void validateData({required BuildContext context}) async {
    String getFirstName = firstNameController.text.trim();
    String getLastName = lastNameController.text.trim();
    String getEmail = emailController.text.trim();
    String getPassword = passwordController.text.trim();
    String getConfirmPassword = confirmPasswordController.text.trim();

    if (getFirstName.isEmpty) {
      Utils.showSnackbar(context: context, mesg: "First Name can't be Empty");
      return;
    } else if (getLastName.isEmpty) {
      Utils.showSnackbar(context: context, mesg: "Last Name can't be Empty");
      return;
    } else if (getEmail.isEmpty) {
      Utils.showSnackbar(context: context, mesg: "Email can't be Empty");
      return;
    } else if (!isEmail(getEmail)) {
      Utils.showSnackbar(context: context, mesg: "Enter a Valid Email");
      return;
    } else if (getPassword.isEmpty) {
      Utils.showSnackbar(context: context, mesg: "Password can't be Empty");
      return;
    } else if (getConfirmPassword.isEmpty) {
      Utils.showSnackbar(context: context, mesg: "This field can't be Empty");
    } else if (getPassword != getConfirmPassword) {
      Utils.showSnackbar(context: context, mesg: "Password does not matched");
    } else if (getPassword.length < 6) {
      Utils.showSnackbar(
          context: context, mesg: "Password can't be less than 6 characters");
      return;
    } else {
      await registerUser(context: context, email: getEmail, password: getPassword);
      await saveUserDataFun(
          context: context,
          email: getEmail,
          password: getPassword,
          firstName: getFirstName,
          lastName: getLastName,
          confirmPassword: getConfirmPassword,

      );
    }
  }

  Future<void> registerUser(
      {required BuildContext context,
      required String email,
      required String password,

      }) async {
    isLoading = true;
    dynamic response = await repo.registerUser(
        context: context, email: email, password: password);
    if (response is UserCredential) {
      Utils.showSnackbar(context: context, mesg: 'Registered Successfully');
      isLoading = false;
    } else {
      print(response);
      Utils.showSnackbar(context: context, mesg: 'Sorry, Not Registered');
      isLoading = false;
    }
  }

  Future<void> saveUserDataFun(
      {required BuildContext context,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String confirmPassword,
      }) async {
    isLoading = true;
    dynamic response = await repo.saveUserData(
        context: context,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        confirmPassword: confirmPassword,
    );
    if (response is UserCredential) {
      // Utils.showSnackbar(context: context, mesg: 'Saved User Data');
      isLoading = false;
    } else {
      // Utils.showSnackbar(context: context, mesg: 'Sorry for User Data');
      isLoading = false;
    }
  }
}
