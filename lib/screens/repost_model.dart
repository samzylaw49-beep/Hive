import 'post_model.dart';

class Repost {
  final String username;
  final Post originalPost;
  final DateTime createdAt;
  final String? caption;

  Repost({
    required this.username,
    required this.originalPost,
    required this.createdAt,
    this.caption,
  });
}