import 'package:flutter/material.dart';

class WingChatScreen extends StatelessWidget {
  const WingChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wing Chat'),
      ),
      body: const Center(
        child: Text('Wing Chat Screen'),
      ),
    );
  }
}

