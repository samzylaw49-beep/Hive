 import 'package:flutter/material.dart';

import 'notification_service.dart';



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


  @override
  Widget build(BuildContext context) {


    final notifications =
        NotificationService.notifications;



    return Scaffold(


      appBar: AppBar(

        title:
            const Text(
              "Notifications 🔔",
            ),

      ),




      body: notifications.isEmpty

          ? const Center(

              child: Text(

                "No notifications yet 🐝",

                style:
                    TextStyle(

                  fontSize:
                      18,

                ),

              ),

            )



          : ListView.builder(


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

                      "${notification.fromUser.displayName} ${notification.message}",

                    ),




                    subtitle:
                        Text(

                      notification.type,

                    ),




                  ),


                );


              },


            ),



    );


  }


}