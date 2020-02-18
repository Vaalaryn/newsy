// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a jp locale. All the
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
  String get localeName => 'jp';

  static m0(day) => "Il y a ${day} jour";

  static m1(hours) => "Il y a ${hours} heure(s)";

  static m2(minutes) => "Il y a ${minutes} minute(s)";

  static m3(month) => "Il y a ${month} mois";

  static m4(year) => "Il y a ${year} an(s)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "actualLocale" : MessageLookupByLibrary.simpleMessage("jp"),
    "articleDateInDays" : m0,
    "articleDateInHours" : m1,
    "articleDateInMinutes" : m2,
    "articleDateInMonth" : m3,
    "articleDateInYear" : m4,
    "articleNoDesc" : MessageLookupByLibrary.simpleMessage("説明なし"),
    "articleNoSource" : MessageLookupByLibrary.simpleMessage("ソースなし"),
    "articleReadArticle" : MessageLookupByLibrary.simpleMessage("記事を読む"),
    "articleShowMore" : MessageLookupByLibrary.simpleMessage("詳細"),
    "filterCustom" : MessageLookupByLibrary.simpleMessage("パーソナルフィルター"),
    "filterDefault" : MessageLookupByLibrary.simpleMessage("デフォルトでフィルタリング"),
    "filterSelect" : MessageLookupByLibrary.simpleMessage("フィルターを選択してください"),
    "profilColorSelect" : MessageLookupByLibrary.simpleMessage("メインカラー"),
    "profilDarkTheme" : MessageLookupByLibrary.simpleMessage("ナイトモード"),
    "profilDisconnect" : MessageLookupByLibrary.simpleMessage("ログアウト"),
    "profilLangDe" : MessageLookupByLibrary.simpleMessage("Deutsch"),
    "profilLangEn" : MessageLookupByLibrary.simpleMessage("English"),
    "profilLangEs" : MessageLookupByLibrary.simpleMessage("Español"),
    "profilLangFr" : MessageLookupByLibrary.simpleMessage("Français"),
    "profilLangJp" : MessageLookupByLibrary.simpleMessage("日本の"),
    "profilLangLabel" : MessageLookupByLibrary.simpleMessage("言語を選択してください"),
    "profilLangTitle" : MessageLookupByLibrary.simpleMessage("言語"),
    "profilThemeTitle" : MessageLookupByLibrary.simpleMessage("テーマ"),
    "profilUpdateAvatar" : MessageLookupByLibrary.simpleMessage("アバターを編集する"),
    "profilUpdateMail" : MessageLookupByLibrary.simpleMessage("メールを修正する"),
    "profilUpdatePassword" : MessageLookupByLibrary.simpleMessage("パスワードを変更する"),
    "profilUpdateUsername" : MessageLookupByLibrary.simpleMessage("ニックネームを変更する"),
    "profilUser" : MessageLookupByLibrary.simpleMessage("プロフィール情報"),
    "snackBarFavoritesSet" : MessageLookupByLibrary.simpleMessage("お気に入りに追加された記事"),
    "snackBarFavoritesUnset" : MessageLookupByLibrary.simpleMessage("お気に入りから削除された記事"),
    "snackBarReminderSet" : MessageLookupByLibrary.simpleMessage("通知を追加しました"),
    "snackBarReminderUnset" : MessageLookupByLibrary.simpleMessage("リマインダーを削除しました")
  };
}
