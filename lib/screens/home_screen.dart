 import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;


  final List<Widget> pages = const [

    HiveFeed(),

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
          "Hive 🐝",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            onPressed: () {},

            icon: const Icon(
              Icons.chat_bubble_outline,
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



class HiveFeed extends StatelessWidget {

  const HiveFeed({super.key});


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


        const SizedBox(height: 8),


        const Text(

          "Discover people, ideas and communities.",

          style: TextStyle(

            fontSize: 16,

          ),

        ),



        const SizedBox(height: 25),



        Card(

          child: Padding(

            padding: const EdgeInsets.all(20),


            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,


              children: const [


                Text(

                  "Hive is ready 🚀",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight: FontWeight.bold,

                  ),

                ),



                SizedBox(height: 10),



                Text(

                  "Your personalized posts will appear here.",

                ),


              ],

            ),

          ),

        ),


      ],

    );

  }

}