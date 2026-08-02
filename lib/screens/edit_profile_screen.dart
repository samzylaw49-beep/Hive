import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usernameController =
      TextEditingController(text: "hive_user");

  final TextEditingController displayNameController =
      TextEditingController(text: "Hive User");

  final TextEditingController bioController =
      TextEditingController(
    text: "Welcome to Hive 🐝",
  );

  final TextEditingController locationController =
      TextEditingController();

  final TextEditingController websiteController =
      TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    displayNameController.dispose();
    bioController.dispose();
    locationController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Stack(
              alignment: Alignment.bottomRight,

              children: [

                const CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),

                FloatingActionButton.small(
                  heroTag: "changePhoto",
                  onPressed: () {
                    // TODO: Change profile picture
                  },
                  child: const Icon(Icons.camera_alt),
                ),

              ],
            ),

            const SizedBox(height: 30),

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: displayNameController,
              decoration: const InputDecoration(
                labelText: "Display Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: bioController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Bio",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: "Location (Optional)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: websiteController,
              decoration: const InputDecoration(
                labelText: "Website (Optional)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
                label: const Text("Save Changes"),
              ),
            ),

            const SizedBox(height: 