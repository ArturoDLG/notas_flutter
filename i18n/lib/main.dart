import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:i18n/app/my_app.dart';
import 'package:i18n/generated/translations.g.dart';
import 'package:i18n/number_symbols_ext.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale(); // Usar la configuracion local para slang.
  // Obtener configuracion del sistema
  final languageCode = PlatformDispatcher.instance.locale.languageCode;
  final countryCode = PlatformDispatcher.instance.locale.countryCode;
  String defualtLocale = languageCode;
  if (countryCode != null) {
    defualtLocale += '_$countryCode';
  }
  // Agregar idioma por defecto
  Intl.defaultLocale = defualtLocale;
  //initializeDateFormatting('es_MX', null); idioma por defecto

  // Recuperar la configuracion de los simbolos usados en la region
  final esMX = numberFormatSymbols['es_MX'] as NumberSymbols;
  numberFormatSymbols['es_MX'] = esMX.copyWith(
    currencySimbol: r'$',
  );

  final esES = numberFormatSymbols['es'] as NumberSymbols;
  numberFormatSymbols['es_ES'] = esES.copyWith(
    currencySimbol: '€',
  );
  runApp(
    TranslationProvider(
      // widget para configurar la internacionalizacion
      child: const MyApp(
          // defaultLanguageCode: languageCode,
          // defaultCountryCode: countryCode ?? '',
          ),
    ),
  );
}
