 import 'comment_model.dart';

class Post {
  final String username;
  final String content;
  final DateTime createdAt;
  int likes;
  final List<Comment> comments;

  Post({
    required this.username,
    required this.content,
    required this.createdAt,
    this.likes = 0,
    this.comments = const [],
  });
}