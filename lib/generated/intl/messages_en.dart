// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(day) => "Il y a ${day} jour";

  static m1(hours) => "Il y a ${hours} heure(s)";

  static m2(minutes) => "Il y a ${minutes} minute(s)";

  static m3(month) => "Il y a ${month} mois";

  static m4(year) => "Il y a ${year} an(s)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "actualLocale" : MessageLookupByLibrary.simpleMessage("en"),
    "articleDateInDays" : m0,
    "articleDateInHours" : m1,
    "articleDateInMinutes" : m2,
    "articleDateInMonth" : m3,
    "articleDateInYear" : m4,
    "articleNoDesc" : MessageLookupByLibrary.simpleMessage("No description"),
    "articleNoSource" : MessageLookupByLibrary.simpleMessage("Unknow source"),
    "articleReadArticle" : MessageLookupByLibrary.simpleMessage("Read article"),
    "articleShowMore" : MessageLookupByLibrary.simpleMessage("Show description"),
    "filterCustom" : MessageLookupByLibrary.simpleMessage("Custom filter"),
    "filterDefault" : MessageLookupByLibrary.simpleMessage("Default filter"),
    "filterSelect" : MessageLookupByLibrary.simpleMessage("Choose a filter"),
    "profilColorSelect" : MessageLookupByLibrary.simpleMessage("Main color"),
    "profilDarkTheme" : MessageLookupByLibrary.simpleMessage("Night mode"),
    "profilDisconnect" : MessageLookupByLibrary.simpleMessage("Disconnect"),
    "profilLangDe" : MessageLookupByLibrary.simpleMessage("Deutsch"),
    "profilLangEn" : MessageLookupByLibrary.simpleMessage("English"),
    "profilLangEs" : MessageLookupByLibrary.simpleMessage("Español"),
    "profilLangFr" : MessageLookupByLibrary.simpleMessage("Français"),
    "profilLangJp" : MessageLookupByLibrary.simpleMessage("日本の"),
    "profilLangLabel" : MessageLookupByLibrary.simpleMessage("Choose a Language"),
    "profilLangTitle" : MessageLookupByLibrary.simpleMessage("Language"),
    "profilThemeTitle" : MessageLookupByLibrary.simpleMessage("Theme"),
    "profilUpdateAvatar" : MessageLookupByLibrary.simpleMessage("Change your avatar"),
    "profilUpdateMail" : MessageLookupByLibrary.simpleMessage("Change your mail"),
    "profilUpdatePassword" : MessageLookupByLibrary.simpleMessage("Change your password"),
    "profilUpdateUsername" : MessageLookupByLibrary.simpleMessage("Change your username"),
    "profilUser" : MessageLookupByLibrary.simpleMessage("User info"),
    "snackBarFavoritesSet" : MessageLookupByLibrary.simpleMessage("Article add to favorite"),
    "snackBarFavoritesUnset" : MessageLookupByLibrary.simpleMessage("Article deleted from favorite"),
    "snackBarReminderSet" : MessageLookupByLibrary.simpleMessage("Reminder set"),
    "snackBarReminderUnset" : MessageLookupByLibrary.simpleMessage("Reminder deleted")
  };
}
