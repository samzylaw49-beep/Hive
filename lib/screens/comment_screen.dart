 import 'package:flutter/material.dart';

import 'post_model.dart';
import 'comment_model.dart';
import 'notification_service.dart';
import 'user_data.dart';



class CommentScreen extends StatefulWidget {

  final Post post;


  const CommentScreen({

    super.key,

    required this.post,

  });



  @override
  State<CommentScreen> createState() =>
      _CommentScreenState();

}



class _CommentScreenState extends State<CommentScreen> {


  final TextEditingController commentController =
      TextEditingController();




  void addComment() {


    final text =
        commentController.text.trim();



    if (text.isEmpty) {

      return;

    }



    setState(() {


      widget.post.comments.add(


        Comment(


          author:
              currentUser,


          text:
              text,


          createdAt:
              DateTime.now(),


        ),


      );



    });



    NotificationService.addNotification(


      fromUser:
          currentUser,


      type:
          "Comment",


      message:
          "commented on your post 💬",


    );



    commentController.clear();


  }





  @override
  void dispose() {

    commentController.dispose();

    super.dispose();

  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
            const Text(
              "Comments 💬",
            ),

      ),



      body: Column(


        children: [



          Expanded(

            child:
                widget.post.comments.isEmpty

                ? const Center(

                    child: Text(

                      "No comments yet.\nBe the first to comment! 🐝",

                      textAlign:
                          TextAlign.center,

                    ),

                  )

                : ListView.builder(

                    padding:
                        const EdgeInsets.all(16),


                    itemCount:
                        widget.post.comments.length,


                    itemBuilder:
                        (context, index) {


                      final comment =
                          widget.post.comments[index];



                      return Card(

                        margin:
                            const EdgeInsets.only(
                              bottom: 12,
                            ),


                        child: Padding(

                          padding:
                              const EdgeInsets.all(12),

                          child: Row(

                            crossAxisAlignment:
                                CrossAxisAlignment.start,


                            children: [

                              const CircleAvatar(

                                child:
                                    Icon(
                                      Icons.person,
                                    ),

                              ),



                              const SizedBox(

                                width:
                                    12,

                              ),


                              Expanded(

                                child: Column(

                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,


                                  children: [


                                    Text(

                                      comment.author.displayName,

                                      style:
                                          const TextStyle(

                                        fontWeight:
                                            FontWeight.bold,

                                      ),

                                    ),


                                    Text(

                                      "@${comment.author.username}",

                                    ),



                                    const SizedBox(

                                      height:
                                          6,

                                    ),



                                    Text(

                                      comment.text,

                                    ),



                                  ],

                                ),

                              ),

                            ],

                          ),

                        ),

                      );


                    },

                  ),

          ),
          Padding(

            padding:
                const EdgeInsets.all(8),


            child: Row(

              children: [


                Expanded(

                  child: TextField(

                    controller:
                        commentController,


                    decoration:
                        const InputDecoration(

                      hintText:
                          "Write a comment...",

                      border:
                          OutlineInputBorder(),

                    ),

                  ),

                ),



                IconButton(

                  onPressed:
                      addComment,


                  icon:
                      const Icon(

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