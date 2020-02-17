import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsy_v2/generated/l10n.dart';
import 'package:newsy_v2/screen/MainScreen.dart';

var _PrimaryColor = Color.fromRGBO(255, 99, 71, 1);
var _AccentColor = Color.fromRGBO(255, 99, 71, 1);
var _BackgroundColor = Color.fromRGBO(255, 255, 255, 1);

  ThemeData myTheme = ThemeData(
      primaryColor: _PrimaryColor,
      accentColor: _AccentColor,
      backgroundColor: _BackgroundColor,
      brightness: Brightness.light,
      );

void main() {
  S.load(Locale('fr', ''));
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
        ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeSwitcher.of(context).myTheme,
      home: MainScreen(),
    );
  }
}

