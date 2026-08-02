 import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';


class InterestScreen extends StatefulWidget {

  const InterestScreen({super.key});


  @override
  State<InterestScreen> createState() =>
      _InterestScreenState();

}



class _InterestScreenState extends State<InterestScreen> {


  final List<String> interests = [

    "Travel",
    "Food",
    "Culture",
    "Gaming",
    "Music",
    "Sports",
    "Technology",
    "Art",
    "Fashion",
    "Movies",

  ];



  final List<String> selectedInterests = [];




  void continueSetup() {


    if (selectedInterests.isEmpty) {


      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content:
              Text("Choose at least one interest"),

        ),

      );


      return;

    }



    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) =>
            const EditProfileScreen(),

      ),

    );


  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
            const Text("Choose Interests"),

      ),




      body: Padding(


        padding:
            const EdgeInsets.all(20),



        child: Column(



          children: [



            const Text(



              "What are you interested in?",



              style: TextStyle(



                fontSize: 28,

                fontWeight:
                    FontWeight.bold,



              ),



            ),




            const SizedBox(height: 10),




            const Text(

              "Choose topics you enjoy. Hive will use this to personalise your experience.",

              textAlign: TextAlign.center,

            ),




            const SizedBox(height: 20),




            Expanded(


              child: ListView.builder(


                itemCount:
                    interests.length,



                itemBuilder:
                    (context, index) {



                  final interest =
                      interests[index];



                  return Card(


                    child: CheckboxListTile(


                      title:
                          Text(interest),



                      value:
                          selectedInterests
                              .contains(interest),



                      onChanged:
                          (value) {


                        setState(() {



                          if (value == true) {


                            selectedInterests
                                .add(interest);


                          } else {


                            selectedInterests
                                .remove(interest);


                          }



                        });



                      },



                    ),


                  );



                },


              ),


            ),




            SizedBox(


              width:
                  double.infinity,



              child:
                  ElevatedButton(



                onPressed:
                    continueSetup,



                child:
                    const Text(
                      "Continue",
                    ),



              ),


            ),



          ],



        ),



      ),


    );


  }

}