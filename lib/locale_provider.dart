import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ValueNotifier<Locale> localeNotifier = ValueNotifier(const Locale('en'));

Future<void> loadLocale() async {
  final prefs = await SharedPreferences.getInstance();
  final code = prefs.getString('languageCode') ?? 'en';
  localeNotifier.value = Locale(code);
}

Future<void> updateLocale(Locale locale) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('languageCode', locale.languageCode);
  localeNotifier.value = locale;
}
