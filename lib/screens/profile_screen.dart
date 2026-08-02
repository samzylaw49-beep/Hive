import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            onPressed: () {},

            icon: const Icon(
              Icons.settings,
            ),

          ),

        ],

      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [


            const CircleAvatar(

              radius: 55,

              child: Icon(
                Icons.person,
                size: 60,
              ),

            ),



            const SizedBox(height: 15),



            const Text(

              "Hive User",

              style: TextStyle(

                fontSize: 26,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 8),



            const Text(

              "Exploring the world with Hive 🐝",

              textAlign: TextAlign.center,

            ),



            const SizedBox(height: 25),



            Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,


              children: [


                profileStat(
                  "Posts",
                  "0",
                ),


                profileStat(
                  "Followers",
                  "0",
                ),


                profileStat(
                  "Following",
                  "0",
                ),


              ],

            ),



            const SizedBox(height: 30),



            SizedBox(

              width: double.infinity,


              child: ElevatedButton(

                onPressed: () {},


                child: const Text(
                  "Edit Profile",
                ),

              ),

            ),



            const SizedBox(height: 15),



            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.favorite,
                ),

                title: const Text(
                  "Interests",
                ),

                subtitle: const Text(
                  "Your selected interests will appear here.",
                ),

              ),

            ),


          ],

        ),

      ),

    );

  }


  static Widget profileStat(
      String title,
      String value,
      ) {

    return Column(

      children: [

        Text(

          value,

          style: const TextStyle(

            fontSize: 22,

            fontWeight: FontWeight.bold,

          ),

        ),


        Text(title),

      ],

    );

  }

}