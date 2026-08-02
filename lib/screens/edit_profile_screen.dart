 import 'package:flutter/material.dart';
import 'user_data.dart';


class EditProfileScreen extends StatefulWidget {

  const EditProfileScreen({super.key});


  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();

}



class _EditProfileScreenState extends State<EditProfileScreen> {


  late TextEditingController usernameController;
  late TextEditingController displayNameController;
  late TextEditingController bioController;
  late TextEditingController locationController;
  late TextEditingController websiteController;



  @override
  void initState() {

    super.initState();

    usernameController =
        TextEditingController(text: currentUser.username);

    displayNameController =
        TextEditingController(text: currentUser.displayName);

    bioController =
        TextEditingController(text: currentUser.bio);

    locationController =
        TextEditingController(text: currentUser.location);

    websiteController =
        TextEditingController(text: currentUser.website);

  }



  void saveProfile() {

    currentUser.username = usernameController.text;
    currentUser.displayName = displayNameController.text;
    currentUser.bio = bioController.text;
    currentUser.location = locationController.text;
    currentUser.website = websiteController.text;


    Navigator.pop(context, true);

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: ListView(

          children: [


            TextField(
              controller: displayNameController,
              decoration: const InputDecoration(
                labelText: "Display Name",
              ),
            ),


            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),


            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                labelText: "Bio",
              ),
            ),


            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: "Location",
              ),
            ),


            TextField(
              controller: websiteController,
              decoration: const InputDecoration(
                labelText: "Website",
              ),
            ),


            const SizedBox(height: 25),


            ElevatedButton(

              onPressed: saveProfile,

              child: const Text(
                "Save Changes",
              ),

            ),

          ],

        ),

      ),

    );

  }

}