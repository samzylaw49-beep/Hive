 import 'package:flutter/material.dart';
import 'post_model.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController postController =
      TextEditingController();

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  void publishPost() {
    if (postController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Write something first."),
        ),
      );
      return;
    }

    final post = Post(
      username: "Hive User",
      content: postController.text.trim(),
      createdAt: DateTime.now(),
    );

    Navigator.pop(context, post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: postController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: "What's happening on Hive?",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: publishPost,
                icon: const Icon(Icons.send),
                label: const Text("Publish"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}