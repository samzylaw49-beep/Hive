import 'package:flutter/material.dart';
import 'post_model.dart';
import 'comment_model.dart';

class CommentScreen extends StatefulWidget {
  final Post post;

  const CommentScreen({
    super.key,
    required this.post,
  });

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentController =
      TextEditingController();

  void addComment() {
    if (commentController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      widget.post.comments.add(
        Comment(
          username: "You",
          text: commentController.text.trim(),
          createdAt: DateTime.now(),
        ),
      );
    });

    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments 💬"),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: widget.post.comments.length,

              itemBuilder: (context, index) {
                final comment =
                    widget.post.comments[index];

                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),

                  title: Text(
                    comment.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    comment.text,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: commentController,

                    decoration: const InputDecoration(
                      hintText: "Write a comment...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                IconButton(
                  onPressed: addComment,

                  icon: const Icon(
                    Icons.send,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}