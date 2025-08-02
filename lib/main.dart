import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/profile_setup_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WingApp());
}

class WingApp extends StatefulWidget {
  const WingApp({super.key});

  @override
  State<WingApp> createState() => _WingAppState();
}

class _WingAppState extends State<WingApp> {
  late Future<bool> _profileCompletedFuture;

  Future<bool> checkIfProfileCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasCompletedSetup') ?? false;
  }

  @override
  void initState() {
    super.initState();
    _profileCompletedFuture = checkIfProfileCompleted();
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
        future: _profileCompletedFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(); // טעינה
          }
          return snapshot.data! ? const HomeScreen() : const ProfileSetupScreen();
        },
      ),
    );
  }
}
