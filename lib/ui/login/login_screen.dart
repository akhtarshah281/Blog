import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/ui/forgot/forgot_screen.dart';
import 'package:firebase_practice/ui/home/home_screen.dart';
import 'package:firebase_practice/ui/login/login_vm.dart';
import 'package:firebase_practice/ui/register/register_screen.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        var user = FirebaseAuth.instance.currentUser;
        if(user != null) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVM>(builder: (context, vm, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 3),
                TextField(
                  controller: vm.emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: vm.passwordController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      labelText: 'Password'),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Utils.nextScreen(
                          context: context,
                          screenRouteName: ForgotScreen.routeName);
                    },
                    child: Text('Forgot Password '),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.lightBlue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: BorderSide(color: Colors.red)
                        ))),
                    onPressed: vm.isLoading
                        ? null
                        : () {
                            vm.validateUser(context: context);
                          },
                    child: vm.isLoading
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                      onPressed: () {
                        Utils.nextScreen(
                            context: context,
                            screenRouteName: RegisterScreen.routeName);
                      },
                      child: Text(
                        "Don't Have an Account ? Register",
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
