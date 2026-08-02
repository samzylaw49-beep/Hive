 import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Profile",
        ),


        actions: [

          IconButton(

            icon: const Icon(
              Icons.settings,
            ),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) =>
                      const SettingsScreen(),

                ),

              );

            },

          ),

        ],

      ),



      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [


            const CircleAvatar(

              radius: 60,

              child: Icon(

                Icons.person,

                size: 70,

              ),

            ),



            const SizedBox(height: 20),



            const Text(

              "Hive User",

              style: TextStyle(

                fontSize: 26,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 5),



            const Text(

              "@hive_user",

              style: TextStyle(

                color: Colors.grey,

              ),

            ),



            const SizedBox(height: 15),



            const Text(

              "Welcome to Hive 🐝\nBuilding ideas and communities.",

              textAlign: TextAlign.center,

            ),



            const SizedBox(height: 25),



            Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,


              children: const [


                Column(

                  children: [

                    Text(

                      "0",

                      style: TextStyle(

                        fontSize: 22,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    Text("Posts"),

                  ],

                ),



                Column(

                  children: [

                    Text(

                      "0",

                      style: TextStyle(

                        fontSize: 22,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    Text("Followers"),

                  ],

                ),



                Column(

                  children: [

                    Text(

                      "0",

                      style: TextStyle(

                        fontSize: 22,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    Text("Following"),

                  ],

                ),


              ],

            ),



            const SizedBox(height: 30),



            SizedBox(

              width: double.infinity,


              child: ElevatedButton.icon(

                onPressed: () {


                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (context) =>
                          const EditProfileScreen(),

                    ),

                  );


                },


                icon: const Icon(

                  Icons.edit,

                ),


                label: const Text(

                  "Edit Profile",

                ),


              ),

            ),



          ],

        ),

      ),

    );

  }
}