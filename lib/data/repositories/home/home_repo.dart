import 'package:firebase_practice/base/base_repo.dart';

abstract class HomeRepo extends BaseRepo {
Future<dynamic> getPosts();
}
