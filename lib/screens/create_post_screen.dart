import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'chat_list_screen.dart';
import 'notifications_screen.dart';
import 'create_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  List<String> posts = [
    "Welcome to Hive 🐝",
  ];


  @override
  Widget build(BuildContext context) {

    final pages = [

      HiveFeed(posts: posts),

      const Center(
        child: Text(
          "Search",
          style: TextStyle(fontSize: 28),
        ),
      ),

      const NotificationsScreen(),

      const ProfileScreen(),

    ];


    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Hive 🐝",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),


        actions: [

          IconButton(

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ChatListScreen(),
                ),
              );

            },

            icon: const Icon(
              Icons.chat_bubble_outline,
            ),

          ),

        ],

      ),


      body: pages[currentIndex],


      floatingActionButton: FloatingActionButton(

        onPressed: () async {

          final post = await Navigator.push(

            context,

            MaterialPageRoute(

              builder: (context) =>
                  const CreatePostScreen(),

            ),

          );


          if (post != null) {

            setState(() {

              posts.add(post);

            });

          }

        },


        child: const Icon(
          Icons.add,
        ),

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



class HiveFeed extends StatelessWidget {

  final List<String> posts;

  const HiveFeed({
    super.key,
    required this.posts,
  });


  @override
  Widget build(BuildContext context) {

    return ListView.builder(

      padding: const EdgeInsets.all(20),

      itemCount: posts.length,


      itemBuilder: (context, index) {

        return Card(

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Text(
              posts[index],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

          ),

        );

      },

    );

  }

}