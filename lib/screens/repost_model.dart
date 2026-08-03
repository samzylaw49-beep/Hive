 import 'post_model.dart';
import 'user_model.dart';

class Repost {

  final UserProfile author;

  final Post originalPost;

  final DateTime createdAt;

  final String? caption;


  Repost({

    required this.author,

    required this.originalPost,

    required this.createdAt,

    this.caption,

  });

}