import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ActivateWingScreen extends StatelessWidget {
  const ActivateWingScreen({super.key});

  Future<void> _requestScreenCapturePermission(BuildContext context) async {
    final status = await Permission.photos.request();
    if (!status.isGranted) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Screen capture permission denied')),
        );
      }
      return;
    }
    // TODO: Add screen capture activation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activate Wing'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _requestScreenCapturePermission(context),
          child: const Text('Request Screen Capture Permission'),
        ),
      ),
    );
  }
}
