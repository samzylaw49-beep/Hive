 import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: Open Settings Screen
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 25),

            Stack(
              alignment: Alignment.bottomRight,
              children: [

                const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: 65,
                  ),
                ),

                FloatingActionButton.small(
                  heroTag: "editPhoto",
                  onPressed: () {
                    // TODO: Change profile picture
                  },
                  child: const Icon(Icons.camera_alt),
                ),

              ],
            ),

            const SizedBox(height: 15),

            const Text(
              "@hive_user",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Welcome to Hive 🐝",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [

                _ProfileStat(
                  number: "0",
                  title: "Posts",
                ),

                _ProfileStat(
                  number: "0",
                  title: "Followers",
                ),

                _ProfileStat(
                  number: "0",
                  title: "Following",
                ),

              ],
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Open Edit Profile Screen
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit Profile"),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text("My Posts"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Liked Posts"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text("Media"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text("Followers"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.person_add_alt_1),
              title: const Text("Following"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.bookmark_border),
              title: const Text("Saved Posts"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text("Share Profile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text("Help & Support"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // TODO: Log out
              },
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String number;
  final String title;

  const _ProfileStat({
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(title),
      ],
    );
  }
}