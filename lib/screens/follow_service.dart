import 'user_model.dart';

class FollowService {

  static void followUser(
    UserProfile currentUser,
    UserProfile targetUser,
  ) {

    if (!targetUser.followersList
        .contains(currentUser.username)) {

      targetUser.followersList
          .add(currentUser.username);

      targetUser.followers++;

      currentUser.followingList
          .add(targetUser.username);

      currentUser.following++;

    }

  }



  static void unfollowUser(
    UserProfile currentUser,
    UserProfile targetUser,
  ) {

    if (targetUser.followersList
        .contains(currentUser.username)) {

      targetUser.followersList
          .remove(currentUser.username);

      targetUser.followers--;

      currentUser.followingList
          .remove(targetUser.username);

      currentUser.following--;

    }

  }



  static bool isFollowing(
    UserProfile currentUser,
    UserProfile targetUser,
  ) {

    return targetUser.followersList
        .contains(currentUser.username);

  }

}