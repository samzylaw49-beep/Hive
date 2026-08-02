import 'package:flutter/material.dart';
import 'interest_screen.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("About You"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              "Are you a male or female?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            RadioListTile(
              title: const Text("Male"),
              value: "Male",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
            ),

            RadioListTile(
              title: const Text("Female"),
              value: "Female",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
            ),

            RadioListTile(
              title: const Text("Prefer not to say"),
              value: "Prefer not to say",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {

                  if (selectedGender != null) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const InterestScreen(),
                      ),
                    );

                  }

                },

                child: const Text("Continue"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}