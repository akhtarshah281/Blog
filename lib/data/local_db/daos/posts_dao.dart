import 'package:firebase_practice/data/local_db/entities/posts_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PostsDao {
  @Query('SELECT * FROM Posts')
  Future<List<Posts>> findAllPosts();

  @insert
  Future<void> insertPost(Posts posts);
}
