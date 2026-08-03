 class Post {
  final String username;
  final String content;
  final DateTime createdAt;
  int likes;

  Post({
    required this.username,
    required this.content,
    required this.createdAt,
    this.likes = 0,
  });
}