import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../locale_provider.dart' as locale_provider;
import 'profile_screen.dart';
import 'matches_screen.dart';
import 'activate_wing_screen.dart';
import 'wing_chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('appTitle')),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (code) => locale_provider.updateLocale(Locale(code)),
            itemBuilder: (context) => AppLocalizations.languageNames.entries
                .map(
                  (e) => PopupMenuItem(
                    value: e.key,
                    child: Text(e.value),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  );
                },
                child: Text(localizations.translate('myProfile')),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MatchesScreen()),
                  );
                },
                child: Text(localizations.translate('myMatches')),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ActivateWingScreen()),
                  );
                },
                child: Text(localizations.translate('activateWing')),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const WingChatScreen()),
                  );
                },
                child: Text(localizations.translate('chatWithWing')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
