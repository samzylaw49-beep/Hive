class UserProfile {

  String username;
  String displayName;
  String bio;
  String location;
  String website;
  String profileImage;


  UserProfile({

    required this.username,
    required this.displayName,
    required this.bio,

    this.location = "",
    this.website = "",
    this.profileImage = "",

  });

}