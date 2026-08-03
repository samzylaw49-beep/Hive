 import 'package:flutter/material.dart';
import 'chat_list_screen.dart';
import 'create_post_screen.dart';
import 'notifications_screen.dart';
import 'post_model.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'comment_screen.dart';
import 'share_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
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
            icon: const Icon(
              Icons.chat_bubble_outline,
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const ChatListScreen(),
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
          final Post? newPost =
              await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const CreatePostScreen(),
            ),
          );

          if (newPost != null) {
            setState(() {
              posts.insert(0, newPost);
            });
          }
        },
      ),

      bottomNavigationBar:
          BottomNavigationBar(
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
  State<HiveFeed> createState() =>
      _HiveFeedState();
}

class _HiveFeedState extends State<HiveFeed> {

  @override
  Widget build(BuildContext context) {

    if (widget.posts.isEmpty) {
      return const Center(
        child: Text(
          "