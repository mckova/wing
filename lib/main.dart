import 'package:flutter/material.dart';
import 'screens/profile_setup_screen.dart';

void main() {
  runApp(const WingApp());
}

class WingApp extends StatelessWidget {
  const WingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const ProfileSetupScreen(),
    );
  }
}
