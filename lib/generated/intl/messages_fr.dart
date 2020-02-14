// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static m0(day) => "Il y a ${day} jour";

  static m1(hours) => "Il y a ${hours} heure(s)";

  static m2(minutes) => "Il y a ${minutes} minute(s)";

  static m3(month) => "Il y a ${month} mois";

  static m4(year) => "Il y a ${year} an(s)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "actualLocale" : MessageLookupByLibrary.simpleMessage("fr"),
    "articleDateInDays" : m0,
    "articleDateInHours" : m1,
    "articleDateInMinutes" : m2,
    "articleDateInMonth" : m3,
    "articleDateInYear" : m4,
    "articleNoDesc" : MessageLookupByLibrary.simpleMessage("Pas de source"),
    "articleNoSource" : MessageLookupByLibrary.simpleMessage("Pas de source"),
    "articleReadArticle" : MessageLookupByLibrary.simpleMessage("Lire l\'article"),
    "articleShowMore" : MessageLookupByLibrary.simpleMessage("En savoir plus"),
    "filterCustom" : MessageLookupByLibrary.simpleMessage("Filtre perso"),
    "filterDefault" : MessageLookupByLibrary.simpleMessage("Filtre par default"),
    "filterSelect" : MessageLookupByLibrary.simpleMessage("Choisir un filtre"),
    "profilColorSelect" : MessageLookupByLibrary.simpleMessage("Couleur principale"),
    "profilDarkTheme" : MessageLookupByLibrary.simpleMessage("Mode nuit"),
    "profilDisconnect" : MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "profilLangDe" : MessageLookupByLibrary.simpleMessage("Deutsch"),
    "profilLangEn" : MessageLookupByLibrary.simpleMessage("English"),
    "profilLangEs" : MessageLookupByLibrary.simpleMessage("Español"),
    "profilLangFr" : MessageLookupByLibrary.simpleMessage("Français"),
    "profilLangJp" : MessageLookupByLibrary.simpleMessage("日本の"),
    "profilLangLabel" : MessageLookupByLibrary.simpleMessage("Choisir une langue"),
    "profilLangTitle" : MessageLookupByLibrary.simpleMessage("Langue"),
    "profilThemeTitle" : MessageLookupByLibrary.simpleMessage("Theme"),
    "profilUpdateAvatar" : MessageLookupByLibrary.simpleMessage("Modifier votre avatar"),
    "profilUpdateMail" : MessageLookupByLibrary.simpleMessage("Modifier votre mail"),
    "profilUpdatePassword" : MessageLookupByLibrary.simpleMessage("Modifier votre mot de passe"),
    "profilUpdateUsername" : MessageLookupByLibrary.simpleMessage("Modifier votre pseudo"),
    "profilUser" : MessageLookupByLibrary.simpleMessage("Info Profil"),
    "snackBarFavoritesSet" : MessageLookupByLibrary.simpleMessage("Article ajouté aux favoris"),
    "snackBarFavoritesUnset" : MessageLookupByLibrary.simpleMessage("Article supprimé des favoris"),
    "snackBarReminderSet" : MessageLookupByLibrary.simpleMessage("Rappel ajouté"),
    "snackBarReminderUnset" : MessageLookupByLibrary.simpleMessage("Rappel supprimé")
  };
}
