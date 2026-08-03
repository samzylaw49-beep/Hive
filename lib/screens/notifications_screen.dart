 import 'package:flutter/material.dart';
import 'notification_model.dart';
import 'user_data.dart';


class NotificationsScreen extends StatefulWidget {

  const NotificationsScreen({
    super.key,
  });


  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();

}



class _NotificationsScreenState
    extends State<NotificationsScreen> {


  final List<HiveNotification> notifications = [


    HiveNotification(

      fromUser: currentUser,

      type: "Welcome",

      message:
          "Welcome to Hive 🐝",

      createdAt:
          DateTime.now(),

    ),


  ];




  @override
  Widget build(BuildContext context) {


    if (notifications.isEmpty) {


      return const Center(


        child: Text(

          "No notifications yet 🐝",

          style:
              TextStyle(

            fontSize:
                18,

          ),

        ),


      );


    }



    return ListView.builder(


      padding:
          const EdgeInsets.all(16),



      itemCount:
          notifications.length,



      itemBuilder:
          (context, index) {


        final notification =
            notifications[index];



        return Card(


          margin:
              const EdgeInsets.only(
                bottom: 12,
              ),




          child: ListTile(


            leading:
                const CircleAvatar(

              child:
                  Icon(
                    Icons.person,
                  ),

            ),



            title:
                Text(


              notification.message,


              style:
                  const TextStyle(

                fontWeight:
                    FontWeight.bold,

              ),


            ),




            subtitle:
                Text