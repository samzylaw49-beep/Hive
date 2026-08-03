import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, String>> users = [

    {
      "name": "Hive Official",
      "username": "@hive",
    },

    {
      "name": "Samzy",
      "username": "@samzy001",
    },

    {
      "name": "Alex",
      "username": "@alex",
    },

    {
      "name": "Sophia",
      "username": "@sophia",
    },

    {
      "name": "Daniel",
      "username": "@daniel",
    },

  ];

  String search = "";

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final filteredUsers = users.where((user) {

      return user["name"]!
              .toLowerCase()
              .contains(search.toLowerCase()) ||

          user["username"]!
              .toLowerCase()
              .contains(search.toLowerCase());

    }).toList();

    return Scaffold(

      appBar: AppBar(
        title: const Text("Search"),
      ),

      body: Column(

        children: [

          Padding(

            padding: const EdgeInsets.all(15),

            child: TextField(

              controller: searchController,

              decoration: InputDecoration(

                hintText: "Search Hive...",

                prefixIcon:
                    const Icon(Icons.search),

                border: OutlineInputBorder(

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

            child: ListView.builder(

              itemCount: filteredUsers.length,

              itemBuilder: (context, index) {

                final user = filteredUsers[index];

                return ListTile(

                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),

                  title: Text(user["name"]!),

                  subtitle:
                      Text(user["username"]!),

                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),

                  onTap: () {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      SnackBar(

                        content: Text(
                          "Opening ${user["name"]}'s profile...",
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