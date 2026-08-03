 import 'package:flutter/material.dart';
import 'chat_list_screen.dart';
import 'create_post_screen.dart';
import 'notifications_screen.dart';
import 'post_model.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Post> posts = [
    Post(
      username: "Hive",
      content: "Welcome to Hive 🐝",
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      HiveFeed(posts: posts),

      const SearchScreen(),

      const NotificationsScreen(),

      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Hive 🐝",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChatListScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: pages[currentIndex],

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () async {
          final Post? newPost = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreatePostScreen(),
            ),
          );

          if (newPost != null) {
            setState(() {
              posts.insert(0, newPost);
            });
          }
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
class HiveFeed extends StatefulWidget {
  final List<Post> posts;

  const HiveFeed({
    super.key,
    required this.posts,
  });

  @override
  State<HiveFeed> createState() => _HiveFeedState();
}

class _HiveFeedState extends State<HiveFeed> {
  @override
  Widget build(BuildContext context) {
    if (widget.posts.isEmpty) {
      return const Center(
        child: Text(
          "No posts yet.\nCreate your first Hive post! 🐝",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final post = widget.posts[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(
                  children: [

                    const CircleAvatar(
                      child: Icon(Icons.person),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            post.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          Text(
                            "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),

                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),

                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  post.content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,

                  children: [

                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          if (post.likes > 0) {
                            post.likes--;
                          } else {
                            post.likes++;
                          }
                        });
                      },

                      icon: Icon(
                        post.likes > 0
                            ? Icons.favorite
                            : Icons.favorite_border,

                        color: post.likes > 0
                            ? Colors.red
                            : null,
                      ),

                      label: Text(
                        post.likes > 0
                            ? "${post.likes}"
                            : "Like",
                      ),
                    ),

                    TextButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.chat_bubble_outline,
                      ),

                      label: const Text(
                        "Comment",
                      ),
                    ),

                    TextButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.share_outlined,
                      ),

                      label: const Text(
                        "Share",
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}