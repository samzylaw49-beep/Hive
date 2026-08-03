import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_data.dart';
import 'follow_service.dart';

class PublicProfileScreen extends StatefulWidget {
  final UserProfile user;

  const PublicProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<PublicProfileScreen> createState() =>
      _PublicProfileScreenState();
}

class _PublicProfileScreenState
    extends State<PublicProfileScreen> {

  void toggleFollow() {

    setState(() {

      if (FollowService.isFollowing(
        currentUser,
        widget.user,
      )) {

        FollowService.unfollowUser(
          currentUser,
          widget.user,
        );

      } else {

        FollowService.followUser(
          currentUser,
          widget.user,
        );

      }

    });

  }


  @override
  Widget build(BuildContext context) {

    final following =
        FollowService.isFollowing(
          currentUser,
          widget.user,
        );


    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.user.username,
        ),
      ),


      body: Center(

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


            const SizedBox(height: 20),


            Text(
              widget.user.displayName,

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),


            Text(
              "@${widget.user.username}",
            ),


            const SizedBox(height: 10),


            Text(
              widget.user.bio,
            ),


            const SizedBox(height: 20),


            Text(
              "${widget.user.followers} Followers",
            ),


            Text(
              "${widget.user.following} Following",
            ),


            const SizedBox(height: 25),


            ElevatedButton(

              onPressed: toggleFollow,


              child: Text(

                following
                    ? "Following"
                    : "Follow",

              ),

            ),

          ],

        ),

      ),

    );

  }

}