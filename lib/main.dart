import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/profile_setup_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WingApp());
}

class WingApp extends StatelessWidget {
  const WingApp({super.key});

  Future<bool> checkIfProfileCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasCompletedSetup') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: checkIfProfileCompleted(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ); // טעינה
          }
          return snapshot.data! ? const HomeScreen() : const ProfileSetupScreen();
        },
      ),
    );
  }
}
