import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_localizations.dart';
import '../locale_provider.dart' as locale_provider;
import 'home_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String gender = 'other';
  String lookingFor = 'any';
  String languageCode = locale_provider.localeNotifier.value.languageCode;

  final List<String> genders = ['male', 'female', 'other'];
  final List<String> preferences = ['male', 'female', 'both', 'any'];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(localizations.translate('setupProfile'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration:
                    InputDecoration(labelText: localizations.translate('language')),
                value: languageCode,
                items: AppLocalizations.languageNames.entries
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.key,
                        child: Text(e.value),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => languageCode = value!);
                  locale_provider.updateLocale(Locale(value!));
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:
                    InputDecoration(labelText: localizations.translate('nameLabel')),
                validator: (value) => (value == null || value.isEmpty)
                    ? localizations.translate('nameValidation')
                    : null,
                onSaved: (value) => name = value!,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration:
                    InputDecoration(labelText: localizations.translate('genderLabel')),
                value: gender,
                items: genders
                    .map(
                      (g) => DropdownMenuItem(
                        value: g,
                        child: Text(localizations.translate(g)),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => gender = value!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: localizations.translate('lookingForLabel')),
                value: lookingFor,
                items: preferences
                    .map(
                      (p) => DropdownMenuItem(
                        value: p,
                        child: Text(localizations.translate(p)),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => lookingFor = value!),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('hasCompletedSetup', true);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: Text(localizations.translate('continue')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
