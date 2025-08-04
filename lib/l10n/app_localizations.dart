import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('de'),
    Locale('he'),
    Locale('ru'),
    Locale('ar'),
  ];

  static const Map<String, String> languageNames = {
    'en': 'English',
    'es': 'Español',
    'de': 'Deutsch',
    'he': 'עברית',
    'ru': 'Русский',
    'ar': 'العربية',
  };

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Wing',
      'myProfile': 'My Profile',
      'myMatches': 'My Matches',
      'activateWing': 'Activate Wing',
      'chatWithWing': 'Chat with Wing',
      'setupProfile': 'Set up your profile',
      'nameLabel': 'Name',
      'nameValidation': 'Please enter your name',
      'genderLabel': 'Your gender',
      'lookingForLabel': 'Looking for',
      'continue': 'Continue',
      'male': 'Male',
      'female': 'Female',
      'other': 'Other',
      'both': 'Both',
      'any': 'Any',
      'language': 'Language',
    },
    'es': {
      'appTitle': 'Wing',
      'myProfile': 'Mi perfil',
      'myMatches': 'Mis coincidencias',
      'activateWing': 'Activar Wing',
      'chatWithWing': 'Chatear con Wing',
      'setupProfile': 'Configura tu perfil',
      'nameLabel': 'Nombre',
      'nameValidation': 'Por favor ingresa tu nombre',
      'genderLabel': 'Tu género',
      'lookingForLabel': 'Buscando',
      'continue': 'Continuar',
      'male': 'Hombre',
      'female': 'Mujer',
      'other': 'Otro',
      'both': 'Ambos',
      'any': 'Cualquiera',
      'language': 'Idioma',
    },
    'de': {
      'appTitle': 'Wing',
      'myProfile': 'Mein Profil',
      'myMatches': 'Meine Matches',
      'activateWing': 'Wing aktivieren',
      'chatWithWing': 'Mit Wing chatten',
      'setupProfile': 'Richte dein Profil ein',
      'nameLabel': 'Name',
      'nameValidation': 'Bitte gib deinen Namen ein',
      'genderLabel': 'Dein Geschlecht',
      'lookingForLabel': 'Suche nach',
      'continue': 'Weiter',
      'male': 'Männlich',
      'female': 'Weiblich',
      'other': 'Andere',
      'both': 'Beide',
      'any': 'Beliebig',
      'language': 'Sprache',
    },
    'he': {
      'appTitle': 'Wing',
      'myProfile': 'הפרופיל שלי',
      'myMatches': 'ההתאמות שלי',
      'activateWing': 'הפעל את Wing',
      'chatWithWing': 'שוחח עם Wing',
      'setupProfile': 'הגדר את הפרופיל שלך',
      'nameLabel': 'שם',
      'nameValidation': 'אנא הזן את שמך',
      'genderLabel': 'המגדר שלך',
      'lookingForLabel': 'מחפש/ת',
      'continue': 'המשך',
      'male': 'זכר',
      'female': 'נקבה',
      'other': 'אחר',
      'both': 'שניהם',
      'any': 'כל אחד',
      'language': 'שפה',
    },
    'ru': {
      'appTitle': 'Wing',
      'myProfile': 'Мой профиль',
      'myMatches': 'Мои совпадения',
      'activateWing': 'Активировать Wing',
      'chatWithWing': 'Чат с Wing',
      'setupProfile': 'Настройте свой профиль',
      'nameLabel': 'Имя',
      'nameValidation': 'Пожалуйста, введите ваше имя',
      'genderLabel': 'Ваш пол',
      'lookingForLabel': 'Ищу',
      'continue': 'Продолжить',
      'male': 'Мужской',
      'female': 'Женский',
      'other': 'Другой',
      'both': 'Оба',
      'any': 'Любой',
      'language': 'Язык',
    },
    'ar': {
      'appTitle': 'Wing',
      'myProfile': 'ملفي الشخصي',
      'myMatches': 'تطابقي',
      'activateWing': 'فعّل Wing',
      'chatWithWing': 'تحدث مع Wing',
      'setupProfile': 'أعد إعداد ملفك الشخصي',
      'nameLabel': 'الاسم',
      'nameValidation': 'يرجى إدخال اسمك',
      'genderLabel': 'جنسك',
      'lookingForLabel': 'يبحث عن',
      'continue': 'متابعة',
      'male': 'ذكر',
      'female': 'أنثى',
      'other': 'آخر',
      'both': 'كلاهما',
      'any': 'أي',
      'language': 'اللغة',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'de', 'he', 'ru', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
