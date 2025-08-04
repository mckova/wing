import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';
import 'locale_provider.dart';
import 'screens/profile_setup_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadLocale();
  runApp(const WingApp());
}

class WingApp extends StatelessWidget {
  const WingApp({super.key});

  Future<bool> checkIfProfileCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasCompletedSetup') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        return MaterialApp(
          title: 'Wing',
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            useMaterial3: true,
          ),
          home: FutureBuilder<bool>(
            future: checkIfProfileCompleted(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return snapshot.data! ? const HomeScreen() : const ProfileSetupScreen();
            },
          ),
        );
      },
    );
  }
}
