import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n/app/pages/home/home_view.dart';
import 'package:i18n/generated/translations.g.dart';

// Convertimos MyApp en un StatefulWidget para poder obtener las configuraciones
// a traves del contexto en otras vistas.
//
// class MyApp extends StatefulWidget {
//   final String defaultLanguageCode;
//   final String defaultCountryCode;
//   const MyApp({
//     super.key,
//     required this.defaultLanguageCode,
//     required this.defaultCountryCode,
//   });

//   @override
//   State<MyApp> createState() => MyAppState();
// }

//class MyAppState extends State<MyApp> {
class MyApp extends StatelessWidget {
  // Con slang no es necesario usar un StatefulWidget
  const MyApp({super.key});

  // late Locale _locale;

  // MyApp({super.key});
  // Locale get locale => _locale; obtener el idioma actual de la app
  // final _supportedLocales = const [
  //   Locale('en'),
  //   Locale('es'),
  //   Locale('es', 'MX'),
  // ]; idiomas soportados

  // @override
  // void initState() {
  // iniciar la configuracion de _locale
  //   super.initState();
  //   _locale = Locale(
  //     widget.defaultLanguageCode,
  //     widget.defaultCountryCode,
  //   );
  //   _locale = _supportedLocales.firstWhere(
  //     (e) =>
  //         e.languageCode == locale.languageCode &&
  //         e.countryCode == _locale.countryCode,
  //     orElse: () => _supportedLocales.first,
  //   );
  // }
  // cambiar el idioma de la app.
  // void changeLanguage(Locale locale) {
  //   setState(() {
  //     if (locale.countryCode?.isNotEmpty ?? false) {
  //       Intl.defaultLocale = '${locale.languageCode}_${locale.countryCode}';
  //     } else {
  //       Intl.defaultLocale = locale.languageCode;
  //     }

  //     _locale = locale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      localizationsDelegates: const [
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      //supportedLocales: _supportedLocales,
      // idiomas soportados
      supportedLocales: AppLocaleUtils.supportedLocales,
      //locale: _locale,
      // idioma actual
      locale: TranslationProvider.of(context).flutterLocale,
    );
  }
}
