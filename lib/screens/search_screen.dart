 import 'package:flutter/material.dart';
import 'public_profile_screen.dart';
import 'user_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController searchController =
      TextEditingController();


  final List<UserProfile> users = [

    UserProfile(
      username: "hive",
      displayName: "Hive Official",
      bio: "Welcome to Hive 🐝",
    ),


    UserProfile(
      username: "samzy001",
      displayName: "Samzy",
      bio: "Building the future 🚀",
    ),


    UserProfile(
      username: "alex",
      displayName: "Alex",
      bio: "Hello Hive",
    ),


    UserProfile(
      username: "sophia",
      displayName: "Sophia",
      bio: "Love music 🎵",
    ),


    UserProfile(
      username: "daniel",
      displayName: "Daniel",
      bio: "Welcome!",
    ),

  ];


  String search = "";


  @override
  void dispose() {

    searchController.dispose();

    super.dispose();

  }



  @override
  Widget build(BuildContext context) {


    final filteredUsers =
        users.where((user) {

      return user.displayName
              .toLowerCase()
              .contains(search.toLowerCase()) ||

          user.username
              .toLowerCase()
              .contains(search.toLowerCase());

    }).toList();



    return Scaffold(

      appBar: AppBar(

        title:
            const Text("Search"),

      ),



      body: Column(

        children: [


          Padding(

            padding:
                const EdgeInsets.all(15),


            child: TextField(

              controller:
                  searchController,


              decoration:
                  InputDecoration(

                hintText:
                    "Search Hive...",


                prefixIcon:
                    const Icon(
                      Icons.search,
                    ),


                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(15),

                ),

              ),



              onChanged: (value) {

                setState(() {

                  search = value;

                });

              },

            ),

          ),



          Expanded(

            child:
                ListView.builder(


              itemCount:
                  filteredUsers.length,


              itemBuilder:
                  (context, index) {


                final user =
                    filteredUsers[index];



                return ListTile(


                  leading:
                      const CircleAvatar(

                    child:
                        Icon(
                          Icons.person,
                        ),

                  ),



                  title:
                      Text(
                        user.displayName,
                      ),



                  subtitle:
                      Text(
                        "@${user.username}",
                      ),



                  trailing:
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),



                  onTap: () {


                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                            PublicProfileScreen(
                              user: user,
                            ),

                      ),

                    );


                  },


                );


              },


            ),

          ),

        ],

      ),

    );

  }

}