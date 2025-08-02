import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ActivateWingScreen extends StatelessWidget {
  const ActivateWingScreen({super.key});

  Future<void> _captureScreenshot() async {
    // Placeholder stub for screenshot logic
    debugPrint('Screenshot captured');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activate Wing')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Wing is now watching your screen…'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final status = await Permission.storage.request();
                if (status.isGranted) {
                  await _captureScreenshot();
                }
              },
              child: const Text('Take Screenshot'),
            ),
          ],
        ),
      ),
    );
  }
}
