import 'package:flutter/material.dart';
import 'home_screen.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
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
  ];

  final List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your interests"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Text(
              "What do you prefer?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: interests.length,
                itemBuilder: (context, index) {

                  String interest = interests[index];

                  return CheckboxListTile(
                    title: Text(interest),

                    value: selectedInterests.contains(interest),

                    onChanged: (value) {
                      setState(() {

                        if (value == true) {
                          selectedInterests.add(interest);
                        } else {
                          selectedInterests.remove(interest);
                        }

                      });
                    },
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const HomeScreen(),
                    ),
                  );

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