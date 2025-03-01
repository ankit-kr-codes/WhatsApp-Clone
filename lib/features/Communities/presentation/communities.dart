import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme.dart';

class Communities extends StatelessWidget {
  const Communities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/communities_logo.webp",
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 15),
          const Text(
            "Stay connected with a community",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 15),
          const Text(
            "Communities bring members together in topic-based groups, and make it easy to get admin announcements. Any community you're added to will appear here.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: const Text(
              "See example communities >",
              style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(AppColors.primaryGreen),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Start your community",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
