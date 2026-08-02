 import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          const Text(
            "Account",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Edit Profile"),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const EditProfileScreen(),
                ),
              );

            },
          ),


          const Divider(),


          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),

            onTap: () {},
          ),


          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy"),

            onTap: () {},
          ),


          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),

            onTap: () {},
          ),


          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),

            onTap: () {},

          ),

        ],
      ),
    );
  }
}