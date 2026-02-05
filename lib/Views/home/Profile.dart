import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/preference manager.dart';
import '../Auth/Signin.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String name = "John Doe";
  final String email = "john@email.com";

  final List<Map<String, dynamic>> profiledetails = [
    {"icon": Icons.history, "name": "Trips History"},
    {"icon": Icons.person, "name": "Edit Profile"},
    {"icon": Icons.settings, "name": "Settings"},
    {"icon": Icons.notifications, "name": "Notification Preferences"},
    {"icon": Icons.help_outline, "name": "Help & Feedback"},
    {"icon": Icons.star_rate, "name": "Review Us"},
    {"icon": Icons.logout, "name": "Log Out"},
    {"icon": Icons.delete, "name": "Delete Account"},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "PROFILE",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.darkBlue,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// PROFILE HEADER
            Row(
              children: [
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: width * 0.12,
                  backgroundColor: AppColors.greyColor,
                  child: const Icon(Icons.person, size: 50),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 30),

            /// MENU LIST
            ListView.builder(
              itemCount: profiledetails.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    DottedBorder(
                      dashPattern: const [2, 4],
                      color: AppColors.greyColor,
                      child: SizedBox(width: width * 0.9),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () => onItemTap(index),
                        child: Row(
                          children: [
                            Icon(
                              profiledetails[index]["icon"],
                              color: AppColors.darkBlue,
                              size: 26,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              profiledetails[index]["name"],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            if (index <= 4)
                              const Icon(Icons.arrow_forward_ios, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// UI-ONLY NAVIGATION
  void onItemTap(int index) {
    if (index == 6) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            TextButton(
              onPressed: () async {
                await PreferenceManager.clearPreferences();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Signinscreen()),
                      (route) => false,
                );
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      );
    }
    else if (index == 7) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Delete Account"),
          content: const Text("This action cannot be undone."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      );
    }
  }
}
