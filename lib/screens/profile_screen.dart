 import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';
import 'user_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void openEditProfile() async {

    final updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const EditProfileScreen(),
      ),
    );

    if (updated == true) {
      setState(() {});
    }

  }


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


      body: Center(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const CircleAvatar(

                radius: 55,

                child: Icon(
                  Icons.person,
                  size: 60,
                ),

              ),


              const SizedBox(
                height: 20,
              ),


              Text(

                currentUser.displayName,

                style: const TextStyle(

                  fontSize: 24,

                  fontWeight:
                      FontWeight.bold,

                ),

              ),


              Text(
                "@${currentUser.username}",
              ),


              const SizedBox(
                height: 10,
              ),


              Text(
                currentUser.bio,
                textAlign: TextAlign.center,
              ),


              const SizedBox(
                height: 25,
              ),


              Row(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Column(

                    children: [

                      Text(

                        "${currentUser.followers}",

                        style:
                            const TextStyle(

                          fontSize: 20,

                          fontWeight:
                              FontWeight.bold,

                        ),

                      ),

                      const Text(
                        "Followers",
                      ),

                    ],

                  ),


                  const SizedBox(
                    width: 50,
                  ),


                  Column(

                    children: [

                      Text(

                        "${currentUser.following}",

                        style:
                            const TextStyle(

                          fontSize: 20,

                          fontWeight:
                              FontWeight.bold,

                        ),

                      ),

                      const Text(
                        "Following",
                      ),

                    ],

                  ),

                ],

              ),


              const SizedBox(
                height: 30,
              ),


              ElevatedButton.icon(

                onPressed:
                    openEditProfile,

                icon: const Icon(
                  Icons.edit,
                ),

                label: const Text(
                  "Edit Profile",
                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}
``