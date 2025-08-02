import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'matches_screen.dart';
import 'activate_wing_screen.dart';
import 'wing_chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
                child: const Text("My Profile"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MatchesScreen()));
                },
                child: const Text("My Matches"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ActivateWingScreen()));
                },
                child: const Text("Activate Wing"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => WingChatScreen()));
                },
                child: const Text("Chat with Wing"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
