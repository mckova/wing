import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WingChatScreen extends StatelessWidget {
  WingChatScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  Future<void> _sendMessage(String message) async {
    // Placeholder stub for AI call
    try {
      await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {'Content-Type': 'application/json'},
        body: '{}',
      );
    } catch (e) {
      debugPrint('Failed to send message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wing Chat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text('Your AI wingman is here…'),
              ),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Type your message',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final msg = _controller.text.trim();
                if (msg.isNotEmpty) {
                  _sendMessage(msg);
                  _controller.clear();
                }
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
