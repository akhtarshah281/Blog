import 'package:firebase_practice/data/api_client.dart';
import 'package:firebase_practice/data/local_db/app_database.dart';
import 'package:get_it/get_it.dart';

class BaseRepo{

  ApiClient apiClient = GetIt.I.get<ApiClient>();

  final database = $FloorAppDataBase.databaseBuilder('app_database.db').build();

}