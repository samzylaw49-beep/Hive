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
  State<CommentScreen> createState() =>
      _CommentScreenState();
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
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Comments 💬",
        ),
      ),

      body: Column(
        children: [

          Expanded(
            child: widget.post.comments.isEmpty
                ? const Center(
                    child: Text(
                      "No comments yet.\nBe the first to comment! 🐝",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.all(16),

                    itemCount:
                        widget.post.comments.length,

                    itemBuilder:
                        (context, index) {

                      final comment =
                          widget.post.comments[index];

                      return Card(
                        margin:
                            const EdgeInsets.only(
                          bottom: 12,
                        ),

                        child: Padding(
                          padding:
                              const EdgeInsets.all(12),

                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              const CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                ),
                              ),

                              const SizedBox(
                                width: 12,
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      comment.username,
                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 4,
                                    ),

                                    Text(
                                      comment.text,
                                    ),

                                    const SizedBox(
                                      height: 6,
                                    ),

                                    Text(
                                      "${comment.createdAt.day}/${comment.createdAt.month}/${comment.createdAt.year}",
                                      style:
                                          const TextStyle(
                                        color:
                                            Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
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
                    controller:
                        commentController,

                    decoration:
                        const InputDecoration(
                      hintText:
                          "Write a comment...",
                      border:
                          OutlineInputBorder(),
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