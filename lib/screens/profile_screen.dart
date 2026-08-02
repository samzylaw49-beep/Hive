 import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile"),

        actions: [

          IconButton(
            icon: const Icon(Icons.settings),
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


      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const CircleAvatar(
              radius: 55,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),


            const SizedBox(height: 20),


            const Text(
              "Hive User",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),


            const Text(
              "@hive_user",
            ),


            const SizedBox(height: 20),


            ElevatedButton.icon(

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EditProfileScreen(),
                  ),
                );

              },

              icon: const Icon(Icons.edit),

              label: const Text("Edit Profile"),

            ),

          ],
        ),
      ),
    );
  }
}