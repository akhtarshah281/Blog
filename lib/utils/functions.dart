import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Utils {

  BuildContext context;

  Utils(this.context) : assert (context != null);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

///method to move to next Screen
  static void nextScreen(
      {required BuildContext context, required String screenRouteName, var userId}) {
    Navigator.pushNamed(context, screenRouteName);
  }

  static void showSnackbar({ required BuildContext context, required String mesg}){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text(mesg),
        action: SnackBarAction(label: '', onPressed: scaffold.hideCurrentSnackBar),
      ),

    );
  }
}
