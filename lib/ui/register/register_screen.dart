import 'package:firebase_practice/ui/login/login_screen.dart';
import 'package:firebase_practice/ui/register/register_vm.dart';
import 'package:firebase_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterVM>(builder: (context, vm, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 5),
                  TextField(
                    controller: vm.firstNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: vm.lastNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: vm.emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      isDense: true,
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
                    height: 20,
                  ),
                  TextField(
                    controller: vm.confirmPasswordController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Confirm Password'),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                      onPressed: vm.isLoading? null:(){
                        vm.validateData(context: context);
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
                        'Sign Up',
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              // side: BorderSide(color: Colors.red)
                            ))),
                        onPressed: () {
                          Utils.nextScreen(
                              context: context, screenRouteName: LoginScreen.routeName);
                        },
                        child: Text(
                          "Already Have an Account ? SignIn",
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
