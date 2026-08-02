import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'chat_list_screen.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;


  final List<Widget> pages = [

    const HiveFeed(),

    const Center(
      child: Text(
        "Search",
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    ),

    const NotificationsScreen(),

    const ProfileScreen(),

  ];


  @override
  Widget build(BuildContext context) {

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

        onPressed: () {

          // Create Post will be connected here later

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

  const HiveFeed({super.key});


  @override
  Widget build(BuildContext context) {

    return ListView(

      padding: const EdgeInsets.all(20),

      children: const [

        Text(
          "Welcome to Hive 🐝",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),


        SizedBox(height: 10),


        Text(
          "Discover people, ideas and communities.",
        ),

      ],

    );

  }

}