import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});


  final List<String> users = const [
    "Hive User",
    "Alex",
    "Sarah",
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Messages 🐝",
        ),
      ),


      body: ListView.builder(

        itemCount: users.length,


        itemBuilder: (context, index) {

          return ListTile(

            leading: const CircleAvatar(
              child: Icon(
                Icons.person,
              ),
            ),


            title: Text(
              users[index],
            ),


            subtitle: const Text(
              "Tap to start chatting",
            ),


            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),


            onTap: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) =>
                      const ChatScreen(),

                ),

              );

            },

          );

        },

      ),

    );

  }

}