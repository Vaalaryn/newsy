// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get actualLocale {
    return Intl.message(
      'fr',
      name: 'actualLocale',
      desc: '',
      args: [],
    );
  }

  String get articleShowMore {
    return Intl.message(
      'En savoir plus',
      name: 'articleShowMore',
      desc: '',
      args: [],
    );
  }

  String get articleReadArticle {
    return Intl.message(
      'Lire l\'article',
      name: 'articleReadArticle',
      desc: '',
      args: [],
    );
  }

  String articleDateInYear(dynamic year) {
    return Intl.message(
      'Il y a $year an',
      name: 'articleDateInYear',
      desc: '',
      args: [year],
    );
  }

  String articleDateInYears(dynamic year) {
    return Intl.message(
      'Il y a $year ans',
      name: 'articleDateInYears',
      desc: '',
      args: [year],
    );
  }

  String articleDateInMonth(dynamic month) {
    return Intl.message(
      'Il y a $month mois',
      name: 'articleDateInMonth',
      desc: '',
      args: [month],
    );
  }

  String articleDateInMonths(dynamic month) {
    return Intl.message(
      'Il y a $month mois',
      name: 'articleDateInMonths',
      desc: '',
      args: [month],
    );
  }

  String articleDateInDay(dynamic day) {
    return Intl.message(
      'Il y a $day jour',
      name: 'articleDateInDay',
      desc: '',
      args: [day],
    );
  }

  String articleDateInDays(dynamic day) {
    return Intl.message(
      'Il y a $day jours',
      name: 'articleDateInDays',
      desc: '',
      args: [day],
    );
  }

  String articleDateInHour(dynamic hours) {
    return Intl.message(
      'Il y a $hours heure',
      name: 'articleDateInHour',
      desc: '',
      args: [hours],
    );
  }

  String articleDateInHours(dynamic hours) {
    return Intl.message(
      'Il y a $hours heures',
      name: 'articleDateInHours',
      desc: '',
      args: [hours],
    );
  }

  String articleDateInMinute(dynamic minutes) {
    return Intl.message(
      'Il y a $minutes minute',
      name: 'articleDateInMinute',
      desc: '',
      args: [minutes],
    );
  }

  String articleDateInMinutes(dynamic minutes) {
    return Intl.message(
      'Il y a $minutes minutes',
      name: 'articleDateInMinutes',
      desc: '',
      args: [minutes],
    );
  }

  String get articleNoSource {
    return Intl.message(
      'Pas de source',
      name: 'articleNoSource',
      desc: '',
      args: [],
    );
  }

  String get articleNoDesc {
    return Intl.message(
      'Pas de description',
      name: 'articleNoDesc',
      desc: '',
      args: [],
    );
  }

  String get filterSelect {
    return Intl.message(
      'Choisir un filtre',
      name: 'filterSelect',
      desc: '',
      args: [],
    );
  }

  String get filterDefault {
    return Intl.message(
      'Filtre par default',
      name: 'filterDefault',
      desc: '',
      args: [],
    );
  }

  String get filterCustom {
    return Intl.message(
      'Filtre perso',
      name: 'filterCustom',
      desc: '',
      args: [],
    );
  }

  String get snackBarReminderSet {
    return Intl.message(
      'Rappel ajouté',
      name: 'snackBarReminderSet',
      desc: '',
      args: [],
    );
  }

  String get snackBarReminderUnset {
    return Intl.message(
      'Rappel supprimé',
      name: 'snackBarReminderUnset',
      desc: '',
      args: [],
    );
  }

  String get snackBarFavoritesSet {
    return Intl.message(
      'Article ajouté aux favoris',
      name: 'snackBarFavoritesSet',
      desc: '',
      args: [],
    );
  }

  String get snackBarFavoritesUnset {
    return Intl.message(
      'Article supprimé des favoris',
      name: 'snackBarFavoritesUnset',
      desc: '',
      args: [],
    );
  }

  String get profilUser {
    return Intl.message(
      'Info Profil',
      name: 'profilUser',
      desc: '',
      args: [],
    );
  }

  String get profilUpdateUsername {
    return Intl.message(
      'Modifier votre pseudo',
      name: 'profilUpdateUsername',
      desc: '',
      args: [],
    );
  }

  String get profilUpdateMail {
    return Intl.message(
      'Modifier votre mail',
      name: 'profilUpdateMail',
      desc: '',
      args: [],
    );
  }

  String get profilUpdateAvatar {
    return Intl.message(
      'Modifier votre avatar',
      name: 'profilUpdateAvatar',
      desc: '',
      args: [],
    );
  }

  String get profilUpdatePassword {
    return Intl.message(
      'Modifier votre mot de passe',
      name: 'profilUpdatePassword',
      desc: '',
      args: [],
    );
  }

  String get profilDisconnect {
    return Intl.message(
      'Déconnexion',
      name: 'profilDisconnect',
      desc: '',
      args: [],
    );
  }

  String get profilThemeTitle {
    return Intl.message(
      'Theme',
      name: 'profilThemeTitle',
      desc: '',
      args: [],
    );
  }

  String get profilDarkTheme {
    return Intl.message(
      'Mode nuit',
      name: 'profilDarkTheme',
      desc: '',
      args: [],
    );
  }

  String get profilColorSelect {
    return Intl.message(
      'Couleur principale',
      name: 'profilColorSelect',
      desc: '',
      args: [],
    );
  }

  String get profilLangTitle {
    return Intl.message(
      'Langue',
      name: 'profilLangTitle',
      desc: '',
      args: [],
    );
  }

  String get profilLangLabel {
    return Intl.message(
      'Choisir une langue',
      name: 'profilLangLabel',
      desc: '',
      args: [],
    );
  }

  String get profilLangFr {
    return Intl.message(
      'Français',
      name: 'profilLangFr',
      desc: '',
      args: [],
    );
  }

  String get profilLangEn {
    return Intl.message(
      'English',
      name: 'profilLangEn',
      desc: '',
      args: [],
    );
  }

  String get profilLangDe {
    return Intl.message(
      'Deutsch',
      name: 'profilLangDe',
      desc: '',
      args: [],
    );
  }

  String get profilLangEs {
    return Intl.message(
      'Español',
      name: 'profilLangEs',
      desc: '',
      args: [],
    );
  }

  String get profilLangJp {
    return Intl.message(
      '日本の',
      name: 'profilLangJp',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('de', ''), Locale('en', ''), Locale('es', ''), Locale('fr', ''), Locale('jp', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}