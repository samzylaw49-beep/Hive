 class UserProfile {

  String username;
  String displayName;
  String bio;
  String location;
  String website;
  String profileImage;

  int followers;
  int following;

  List<String> followersList;
  List<String> followingList;


  UserProfile({

    required this.username,
    required this.displayName,
    required this.bio,

    this.location = "",
    this.website = "",
    this.profileImage = "",

    this.followers = 0,
    this.following = 0,

    this.followersList = const [],
    this.followingList = const [],

  });

}