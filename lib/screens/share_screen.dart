import 'package:flutter/material.dart';
import 'post_model.dart';
import 'repost_model.dart';

class ShareScreen extends StatefulWidget {
  final Post post;

  const ShareScreen({
    super.key,
    required this.post,
  });

  @override
  State<ShareScreen> createState() =>
      _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final TextEditingController captionController =
      TextEditingController();

  void repostPost() {
    final repost = Repost(
      username: "You",
      originalPost: widget.post,
      createdAt: DateTime.now(),
      caption: captionController.text.trim().isEmpty
          ? null
          : captionController.text.trim(),
    );

    // Increase repost count on the original post
    widget.post.reposts++;

    Navigator.pop(context, repost);
  }

  @override
  void dispose() {
    captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Share 🔄",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Repost this Hive 🐝",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      widget.post.username,
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      widget.post.content,
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: captionController,

              decoration:
                  const InputDecoration(
                hintText:
                    "Add a caption (optional)",
                border:
                    OutlineInputBorder(),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: repostPost,

                child: const Text(
                  "Repost 🔄",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}