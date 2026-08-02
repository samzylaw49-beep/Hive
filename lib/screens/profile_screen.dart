 import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';
import 'user_data.dart';
import 'post_model.dart';


class ProfileScreen extends StatelessWidget {

  final List<Post> posts;


  const ProfileScreen({

    super.key,

    required this.posts,

  });



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


              radius: 55,


              child: Icon(

                Icons.person,

                size: 60,

              ),


            ),




            const SizedBox(height: 20),




            Text(


              currentUser.displayName,


              style: const TextStyle(


                fontSize: 24,


                fontWeight: FontWeight.bold,


              ),


            ),




            Text(

              "@${currentUser.username}",

            ),




            const SizedBox(height: 15),




            Text(

              currentUser.bio,

              textAlign: TextAlign.center,

            ),




            const SizedBox(height: 20),




            Text(

              "Posts: ${posts.length}",

              style: const TextStyle(

                fontSize: 18,

                fontWeight: FontWeight.bold,

              ),

            ),




            const SizedBox(height: 25),




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




            const SizedBox(height: 30),




            const Text(


              "My Posts",


              style: TextStyle(


                fontSize: 22,

                fontWeight: FontWeight.bold,


              ),


            ),





            ...posts.map(


              (post) => Card(


                child: ListTile(


                  title: Text(

                    post.content,

                  ),


                  subtitle: Text(

                    post.username,

                  ),


                ),


              ),


            ),



          ],


        ),


      ),


    );


  }


}