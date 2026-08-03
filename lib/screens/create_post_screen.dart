 import 'package:flutter/material.dart';
import 'post_model.dart';
import 'user_data.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() =>
      _CreatePostScreenState();
}


class _CreatePostScreenState
    extends State<CreatePostScreen> {

  final TextEditingController postController =
      TextEditingController();


  @override
  void dispose() {

    postController.dispose();

    super.dispose();

  }



  void publishPost() {

    final content =
        postController.text.trim();


    if (content.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content:
              Text(
                "Write something before publishing.",
              ),

        ),

      );


      return;

    }



    final post = Post(

      author: currentUser,

      content: content,

      createdAt:
          DateTime.now(),

    );



    Navigator.pop(
      context,
      post,
    );

  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "Create Post",
            ),

      ),



      body: Padding(

        padding:
            const EdgeInsets.all(20),



        child: Column(

          children: [


            TextField(

              controller:
                  postController,


              maxLines:
                  8,


              decoration:
                  const InputDecoration(

                hintText:
                    "What's happening on Hive? 🐝",


                border:
                    OutlineInputBorder(),

              ),

            ),



            const SizedBox(
              height: 20,
            ),



            SizedBox(

              width:
                  double.infinity,


              child:
                  ElevatedButton.icon(


                onPressed:
                    publishPost,


                icon:
                    const Icon(
                      Icons.send,
                    ),


                label:
                    const Text(
                      "Publish",
                    ),


              ),

            ),


          ],

        ),

      ),

    );

  }

}