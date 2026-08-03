 import 'comment_model.dart';

class Post {
  final String username;
  final String content;
  final DateTime createdAt;

  int likes;
  int reposts;

  final List<Comment> comments;

  Post({
    required this.username,
    required this.content,
    required this.createdAt,
    this.likes = 0,
    this.reposts = 0,
    this.comments = const [],
  });
}