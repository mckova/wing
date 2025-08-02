import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String gender = 'Other';
  String lookingFor = 'Any';

  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> preferences = ['Male', 'Female', 'Both', 'Any'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Set up your profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter your name'
                    : null,
                onSaved: (value) => name = value!,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Your gender'),
                value: gender,
                items: genders
                    .map((g) => DropdownMenuItem(
                          value: g,
                          child: Text(g),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => gender = value!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Looking for'),
                value: lookingFor,
                items: preferences
                    .map((p) => DropdownMenuItem(
                          value: p,
                          child: Text(p),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => lookingFor = value!),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // For now, just show the data in a dialog
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Profile Info'),
                        content: Text('Name: $name\nGender: $gender\nLooking for: $lookingFor'),
                      ),
                    );
                  }
                },
                child: const Text('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
