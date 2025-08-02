import 'package:flutter/material.dart';

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool connectTinder = false;
  bool connectBumble = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tell us about yourself'),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Describe your personality',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'What are you looking for?',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Dating Preferences'),
              Row(
                children: [
                  const Text('Interested in:'),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    items: const [
                      DropdownMenuItem(value: 'men', child: Text('Men')),
                      DropdownMenuItem(value: 'women', child: Text('Women')),
                      DropdownMenuItem(value: 'everyone', child: Text('Everyone')),
                    ],
                    onChanged: (_) {},
                  ),
                ],
              ),
              RangeSlider(
                values: const RangeValues(18, 35),
                min: 18,
                max: 100,
                onChanged: (v) {},
                labels: const RangeLabels('18', '35'),
              ),
              const SizedBox(height: 16),
              const Text('Connect Accounts'),
              SwitchListTile(
                title: const Text('Tinder'),
                value: connectTinder,
                onChanged: (v) => setState(() => connectTinder = v),
              ),
              SwitchListTile(
                title: const Text('Bumble'),
                value: connectBumble,
                onChanged: (v) => setState(() => connectBumble = v),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
