import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/themes/app_themes.dart';
import 'resources/l10n/l10n.dart';


class App extends StatefulWidget {
  const App({super.key});

  static void setTheme(BuildContext context, ThemeMode themeMode) {
    final _AppState? state = context.findAncestorStateOfType<_AppState>();
    state?.theme = themeMode;
  }

  static ThemeMode getTheme(BuildContext context) {
    final _AppState? state = context.findAncestorStateOfType<_AppState>();
    return state?.theme ?? ThemeMode.system;
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? _locale;
  var _themeMode = ThemeMode.light;
  final _appRouter = AppRouter();


  Locale get locale => _locale ?? const Locale('en');

  set theme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  ThemeMode get theme => _themeMode;

  @override
  void initState() {
    super.initState();
    _locale = const Locale('en');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ProviderScope(
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MaterialApp.router(
            themeMode: _themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            locale: _locale,
            routerConfig: _appRouter.config(includePrefixMatches: false),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.delegate.supportedLocales,
          ),
        ),
      ),
    );
  }
}
