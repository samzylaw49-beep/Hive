import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List<Widget> pages = const [

    HomeFeed(),

    Center(
      child: Text(
        "Search",
        style: TextStyle(fontSize: 28),
      ),
    ),

    Center(
      child: Text(
        "Notifications",
        style: TextStyle(fontSize: 28),
      ),
    ),

    Center(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 28),
      ),
    ),

  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Hive",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chat,
            ),
          ),

        ],
      ),


      body: pages[currentIndex],


      floatingActionButton: FloatingActionButton(
        onPressed: () {},

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


class HomeFeed extends StatelessWidget {

  const HomeFeed({super.key});


  @override
  Widget build(BuildContext context) {

    return ListView(

      padding: const EdgeInsets.all(20),

      children: [

        const Text(
          "Welcome to Hive 🐝",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),


        const SizedBox(height: 10),


        const Text(
          "Connect with people and discover new ideas.",
          style: TextStyle(
            fontSize: 16,
          ),
        ),


        const SizedBox(height: 25),


        Card(

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [

                Text(
                  "Your feed is empty",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Posts based on your interests will appear here.",
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}