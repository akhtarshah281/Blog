import 'package:floor/floor.dart';

@entity
class Posts {
  @primaryKey
  final String id;
  final String title;
  final String postDesc;
  final String imageUrl;

  Posts(this.id, this.title, this.postDesc, this.imageUrl);
}
