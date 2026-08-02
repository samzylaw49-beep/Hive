import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController messageController =
      TextEditingController();

  final List<String> messages = [];


  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }


  void sendMessage() {

    if (messageController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      messages.add(messageController.text.trim());
      messageController.clear();
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Chat 🐝"),
      ),


      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: messages.length,

              itemBuilder: (context, index) {

                return ListTile(
                  title: Text(
                    messages[index],
                  ),
                );

              },

            ),

          ),


          Padding(

            padding: const EdgeInsets.all(10),

            child: Row(

              children: [

                Expanded(

                  child: TextField(

                    controller: messageController,

                    decoration: const InputDecoration(
                      hintText: "Type message...",
                      border: OutlineInputBorder(),
                    ),

                  ),

                ),


                IconButton(

                  onPressed: sendMessage,

                  icon: const Icon(
                    Icons.send,
                  ),

                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

}