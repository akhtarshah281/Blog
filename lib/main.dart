import 'package:firebase_practice/data/repositories/add_post/add_post_imp.dart';
import 'package:firebase_practice/data/repositories/add_post/add_post_repo.dart';
import 'package:firebase_practice/data/repositories/profile/profile_repo.dart';
import 'package:firebase_practice/data/repositories/profile/profile_repo_imp.dart';
import 'package:firebase_practice/data/repositories/update/update_repo.dart';
import 'package:firebase_practice/data/repositories/update/update_repo_imp.dart';
import 'package:firebase_practice/on_generate_route.dart';
import 'package:firebase_practice/ui/login/login_screen.dart';
import 'package:firebase_practice/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'data/api_client.dart';
import 'data/repositories/forgot/forgot_repo.dart';
import 'data/repositories/forgot/forgot_repo_imp.dart';
import 'data/repositories/home/home_repo.dart';
import 'data/repositories/home/home_repo_imp.dart';
import 'data/repositories/login/login_repo.dart';
import 'data/repositories/login/login_repo_imp.dart';
import 'data/repositories/register/register_repo.dart';
import 'data/repositories/register/register_repo_imp.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<ApiClient>(ApiClient());
  GetIt.I.registerSingleton<RegisterRepo>(RegisterRepoImp());
  GetIt.I.registerSingleton<LoginRepo>(LoginRepoImp());
  GetIt.I.registerSingleton<ForgotRepo>(ForgotRepoImp());
  GetIt.I.registerSingleton<ProfileRepo>(ProfileRepoImp());
  GetIt.I.registerSingleton<UpdateRepo>(UpdateRepoImp());
  GetIt.I.registerSingleton<HomeRepo>(HomeRepoImp());
  GetIt.I.registerSingleton<AddPostRepo>(AddPostImp());
  await GetIt.I.allReady();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    onGenerateRoute: OnGenerateRoute,
    initialRoute: SplashScreen.routeName,
  ));
}