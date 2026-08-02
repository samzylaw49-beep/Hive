 import 'package:flutter/material.dart';
import 'user_data.dart';
import 'home_screen.dart';


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
        TextEditingController(
          text: currentUser.username,
        );


    displayNameController =
        TextEditingController(
          text: currentUser.displayName,
        );


    bioController =
        TextEditingController(
          text: currentUser.bio,
        );


    locationController =
        TextEditingController(
          text: currentUser.location,
        );


    websiteController =
        TextEditingController(
          text: currentUser.website,
        );


  }




  @override
  void dispose() {

    usernameController.dispose();
    displayNameController.dispose();
    bioController.dispose();
    locationController.dispose();
    websiteController.dispose();

    super.dispose();

  }





  void finishSetup() {


    currentUser.username =
        usernameController.text;


    currentUser.displayName =
        displayNameController.text;


    currentUser.bio =
        bioController.text;


    currentUser.location =
        locationController.text;


    currentUser.website =
        websiteController.text;



    Navigator.pushReplacement(

      context,

      MaterialPageRoute(

        builder: (context) =>
            const HomeScreen(),

      ),

    );


  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
            const Text("Setup Profile"),

      ),




      body: Padding(


        padding:
            const EdgeInsets.all(20),



        child: ListView(


          children: [



            TextField(

              controller:
                  displayNameController,

              decoration:
                  const InputDecoration(

                labelText:
                    "Display Name",

              ),

            ),




            TextField(

              controller:
                  usernameController,

              decoration:
                  const InputDecoration(

                labelText:
                    "Username",

              ),

            ),




            TextField(

              controller:
                  bioController,

              decoration:
                  const InputDecoration(

                labelText:
                    "Bio",

              ),

            ),




            TextField(

              controller:
                  locationController,

              decoration:
                  const InputDecoration(

                labelText:
                    "Location",

              ),

            ),




            TextField(

              controller:
                  websiteController,

              decoration:
                  const InputDecoration(

                labelText:
                    "Website",

              ),

            ),




            const SizedBox(height: 30),




            SizedBox(

              width:
                  double.infinity,



              child: ElevatedButton(



                onPressed:
                    finishSetup,



                child:
                    const Text(
                      "Finish Setup",
                    ),



              ),

            ),



          ],


        ),


      ),


    );


  }

}