import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/app/screen/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newsy_v2/config/AllColors.dart';

ThemeData myTheme = ThemeData(
  primaryColor: AllColor.allColors[0],
  accentColor: AllColor.allColors[0],
  backgroundColor: AllColor.backgroundColor[0],
  brightness: Brightness.dark
);

void main() {
  runApp(
    ThemeSwitcherWidget(
      initialTheme: myTheme,
      child: MyApp(),
    ),
  );
}

class ThemeSwitcher extends InheritedWidget {
  final _ThemeSwitcherWidgetState data;

  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static _ThemeSwitcherWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeSwitcher)
            as ThemeSwitcher)
        .data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher old) {
    return this != old;
  }
}

class ThemeSwitcherWidget extends StatefulWidget {
  final ThemeData initialTheme;
  final Widget child;

  ThemeSwitcherWidget({Key key, this.initialTheme, this.child})
      : assert(initialTheme != null),
        assert(child != null),
        super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  ThemeData myTheme;

  @override
  void initState() {
    super.initState();
  }

  void switchTheme(ThemeData theme) {
    setState(() {
      myTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    myTheme = myTheme ?? widget.initialTheme;
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  static bool themeLoad = false;

  @override
  Widget build(BuildContext context) {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((SharedPreferences prefs) {
      if (prefs.containsKey('lang')) {
        S.load(Locale(prefs.getString('lang'), ''));
      } else {
        S.load(Locale('fr', ''));
      }
      if (prefs.containsKey('themeC') &&
          prefs.containsKey('themeB') &&
          !themeLoad) {
        ThemeSwitcher.of(context).switchTheme(ThemeData(
          primaryColor: AllColor.allColors[prefs.getInt('themeC')],
          accentColor: AllColor.allColors[prefs.getInt('themeC')],
          backgroundColor:
              prefs.getBool('themeB') ? AllColor.backgroundColor[0] : AllColor.backgroundColor[1],
          brightness:
              prefs.getBool('themeB') ? Brightness.dark : Brightness.light,
        ));
        themeLoad = true;
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeSwitcher.of(context).myTheme,
      home: LoginScreen(),
    );
  }
}
