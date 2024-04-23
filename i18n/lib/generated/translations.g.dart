/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 18 (6 per locale)
///
/// Built on 2023-11-14 at 01:38 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';

export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEn> {
  en(languageCode: 'en', build: _TranslationsEn.build),
  es(languageCode: 'es', build: _TranslationsEs.build),
  esMx(languageCode: 'es', countryCode: 'MX', build: _TranslationsEsMx.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, _TranslationsEn> build;

  /// Gets current instance managed by [LocaleSettings].
  _TranslationsEn get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of texts).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = texts.someKey.anotherKey;
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get texts => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final texts = Translations.of(context); // Get texts variable.
/// String a = texts.someKey.anotherKey; // Use texts variable.
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _TranslationsEn of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, _TranslationsEn> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.texts.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  _TranslationsEn get texts => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations<AppLocale, _TranslationsEn> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsEn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final _TranslationsEn _root = this; // ignore: unused_field

  // Translations
  String get helloWorld => 'Hello World';
  String get summary => 'SUMMARY';
  String productName({required Object name}) => 'Product: ${name}';
  String price({required Object price}) => 'Price: ${price}';
  String releaseDate({required Object date}) => 'Release Date: ${date}';
  String payNow({required Object total}) => 'PAY NOW ${total}';
}

// Path: <root>
class _TranslationsEs implements _TranslationsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsEs.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.es,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <es>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _TranslationsEs _root = this; // ignore: unused_field

  // Translations
  @override
  String get helloWorld => 'Hola Mundo';
  @override
  String get summary => 'RESUMEN';
  @override
  String productName({required Object name}) => 'Producto: ${name}';
  @override
  String price({required Object price}) => 'Precio: ${price}';
  @override
  String releaseDate({required Object date}) => 'Fecha: ${date}';
  @override
  String payNow({required Object total}) => 'PAGAR AHORA ${total}';
}

// Path: <root>
class _TranslationsEsMx implements _TranslationsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsEsMx.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.esMx,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <es-MX>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _TranslationsEsMx _root = this; // ignore: unused_field

  // Translations
  @override
  String get helloWorld => 'Hola Mexico';
  @override
  String get summary => 'RESUMEN';
  @override
  String productName({required Object name}) => 'Producto: ${name}';
  @override
  String price({required Object price}) => 'Precio: ${price}';
  @override
  String releaseDate({required Object date}) => 'Fecha: ${date}';
  @override
  String payNow({required Object total}) => 'PAGAR AHORA ${total}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'helloWorld':
        return 'Hello World';
      case 'summary':
        return 'SUMMARY';
      case 'productName':
        return ({required Object name}) => 'Product: ${name}';
      case 'price':
        return ({required Object price}) => 'Price: ${price}';
      case 'releaseDate':
        return ({required Object date}) => 'Release Date: ${date}';
      case 'payNow':
        return ({required Object total}) => 'PAY NOW ${total}';
      default:
        return null;
    }
  }
}

extension on _TranslationsEs {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'helloWorld':
        return 'Hola Mundo';
      case 'summary':
        return 'RESUMEN';
      case 'productName':
        return ({required Object name}) => 'Producto: ${name}';
      case 'price':
        return ({required Object price}) => 'Precio: ${price}';
      case 'releaseDate':
        return ({required Object date}) => 'Fecha: ${date}';
      case 'payNow':
        return ({required Object total}) => 'PAGAR AHORA ${total}';
      default:
        return null;
    }
  }
}

extension on _TranslationsEsMx {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'helloWorld':
        return 'Hola Mexico';
      case 'summary':
        return 'RESUMEN';
      case 'productName':
        return ({required Object name}) => 'Producto: ${name}';
      case 'price':
        return ({required Object price}) => 'Precio: ${price}';
      case 'releaseDate':
        return ({required Object date}) => 'Fecha: ${date}';
      case 'payNow':
        return ({required Object total}) => 'PAGAR AHORA ${total}';
      default:
        return null;
    }
  }
}
