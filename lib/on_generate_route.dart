import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/ui/addPost/add_post_vm.dart';
import 'package:firebase_practice/ui/addPost/add_posts.dart';
import 'package:firebase_practice/ui/forgot/forgot_screen.dart';
import 'package:firebase_practice/ui/forgot/forgot_vm.dart';
import 'package:firebase_practice/ui/home/home_screen.dart';
import 'package:firebase_practice/ui/home/home_vm.dart';
import 'package:firebase_practice/ui/login/login_screen.dart';
import 'package:firebase_practice/ui/login/login_vm.dart';
import 'package:firebase_practice/ui/profile/profile_screen.dart';
import 'package:firebase_practice/ui/profile/profile_vm.dart';
import 'package:firebase_practice/ui/register/register_screen.dart';
import 'package:firebase_practice/ui/register/register_vm.dart';
import 'package:firebase_practice/ui/splash/splash_screen.dart';
import 'package:firebase_practice/ui/update/update_screen.dart';
import 'package:firebase_practice/ui/update/update_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Route<MaterialPageRoute> OnGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => SplashScreen());

    case LoginScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => LoginVM(),
                child: LoginScreen(),
              ));
    case RegisterScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => RegisterVM(),
                child: RegisterScreen(),
              ));
    case ForgotScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => ForgotVM(),
                child: ForgotScreen(),
              ));
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => HomeVM(context),
                child: HomeScreen(),
              ));

    case UpdateProfile.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) =>
                    UpdateVM(snapshot: settings.arguments as DocumentSnapshot),
                child: UpdateProfile(),
              ));
    case ProfileScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => ProfileVm(context),
                child: ProfileScreen(),
              ));
    case AddPosts.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => AddPostVM(),
                child: AddPosts(),
              ));
    default:
      return MaterialPageRoute(builder: (context) => ErrorRoute());
  }
}

class ErrorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('THIS IS WRONG ROUTE'),
      ),
    );
  }
}
