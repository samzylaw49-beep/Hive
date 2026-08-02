 import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';
import 'gender_screen.dart';


class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key});


  @override
  State<SignupScreen> createState() =>
      _SignupScreenState();

}



class _SignupScreenState extends State<SignupScreen> {


  final usernameController =
      TextEditingController();


  final emailController =
      TextEditingController();


  final passwordController =
      TextEditingController();


  final confirmPasswordController =
      TextEditingController();




  @override
  void dispose() {

    usernameController.dispose();

    emailController.dispose();

    passwordController.dispose();

    confirmPasswordController.dispose();

    super.dispose();

  }





  void createAccount() {


    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {


      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content:
              Text("Please fill all fields"),

        ),

      );


      return;

    }




    if (passwordController.text !=
        confirmPasswordController.text) {


      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content:
              Text("Passwords do not match"),

        ),

      );


      return;

    }




    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) =>
            const GenderScreen(),

      ),

    );


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
            const Text("Create Account"),

      ),




      body: Padding(


        padding:
            const EdgeInsets.all(25),




        child: SingleChildScrollView(



          child: Column(



            children: [



              const Text(



                "Create your Hive account",



                style: TextStyle(



                  fontSize: 28,



                  fontWeight:
                      FontWeight.bold,



                ),



              ),




              const SizedBox(height: 30),




              TextField(


                controller:
                    usernameController,


                decoration:
                    const InputDecoration(


                  labelText:
                      "Username",


                  border:
                      OutlineInputBorder(),


                ),


              ),




              const SizedBox(height: 15),




              TextField(


                controller:
                    emailController,


                decoration:
                    const InputDecoration(


                  labelText:
                      "Email",


                  border:
                      OutlineInputBorder(),


                ),


              ),




              const SizedBox(height: 15),




              TextField(


                controller:
                    passwordController,


                obscureText: true,


                decoration:
                    const InputDecoration(


                  labelText:
                      "Password",


                  border:
                      OutlineInputBorder(),


                ),


              ),




              const SizedBox(height: 15),




              TextField(


                controller:
                    confirmPasswordController,


                obscureText: true,


                decoration:
                    const InputDecoration(


                  labelText:
                      "Confirm Password",


                  border:
                      OutlineInputBorder(),


                ),


              ),




              const SizedBox(height: 20),




              const Text(

                "By creating an account, you agree to Hive's",

              ),




              Row(


                mainAxisAlignment:
                    MainAxisAlignment.center,



                children: [



                  TextButton(


                    onPressed: () {


                      Navigator.push(


                        context,


                        MaterialPageRoute(


                          builder: (context) =>
                              const PrivacyScreen(),


                        ),


                      );


                    },


                    child:
                        const Text("Privacy Policy"),


                  ),




                  const Text("and"),




                  TextButton(


                    onPressed: () {


                      Navigator.push(


                        context,


                        MaterialPageRoute(


                          builder: (context) =>
                              const TermsScreen(),


                        ),


                      );


                    },


                    child:
                        const Text("Terms"),


                  ),



                ],


              ),




              const SizedBox(height: 15),




              SizedBox(


                width:
                    double.infinity,



                child:
                    ElevatedButton(



                  onPressed:
                      createAccount,



                  child:
                      const Text(
                        "Create Account",
                      ),



                ),


              ),




              TextButton(


                onPressed: () {


                  Navigator.push(


                    context,


                    MaterialPageRoute(


                      builder: (context) =>
                          const LoginScreen(),


                    ),


                  );


                },



                child:
                    const Text(
                      "Already have an account? Login",
                    ),



              ),




            ],



          ),



        ),



      ),


    );


  }


}