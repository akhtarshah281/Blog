

import 'dart:async';
import 'package:firebase_practice/data/local_db/daos/posts_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entities/posts_entity.dart';
part 'app_database.g.dart'; // the generated code will be there


@Database(version: 1, entities: [Posts])
abstract class AppDataBase extends FloorDatabase{

  PostsDao get postsDao;
}