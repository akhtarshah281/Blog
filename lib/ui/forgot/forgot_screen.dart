import 'package:firebase_practice/ui/forgot/forgot_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatefulWidget {
  static const String routeName = 'forgot';

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotVM>(builder: (context, vm, child) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: vm.emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Enter Email'),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
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
                      onPressed:vm.isLoading
                          ? null
                          : () {
                        vm.userData(context: context);
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
                        'Send Code',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ),
                )
              ],
            )),
          ),
        ),
      );
    });
  }
}
