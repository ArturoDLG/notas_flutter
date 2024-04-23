import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:i18n/app/models/product.dart';
//import 'package:i18n/app/my_app.dart';
import 'package:i18n/app/pages/home/widgets/product_tile.dart';
import 'package:i18n/generated/translations.g.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = <Product>[];

  @override
  void initState() {
    super.initState();
    final faker = Faker();
    for (int i = 0; i < 50; i++) {
      list.add(
        Product(
          name: faker.food.dish(),
          image: faker.image.image(
            keywords: ['food'],
          ),
          price: faker.randomGenerator.decimal(
            min: 0.99,
            scale: 100.0,
          ),
          rate: faker.randomGenerator.decimal(
            min: 1.0,
            scale: 5.0,
          ),
          releaseDate: faker.date.dateTime(
            minYear: 2020,
            maxYear: 2022,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //final appState = context.findAncestorStateOfType<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        //title: Text(AppLocalizations.of(context)!.helloWorld),
        title: Text(
          Translations.of(context).helloWorld,
        ),
        actions: [
          DropdownButton(
            //value: appState?.locale,
            value: TranslationProvider.of(context).locale,
            items: const [
              DropdownMenuItem(
                //value: Locale('en'),
                value: AppLocale.en,
                child: Text('English'),
              ),
              DropdownMenuItem(
                //value: Locale('es'),
                value: AppLocale.es,
                child: Text('Español'),
              ),
              DropdownMenuItem(
                //value: Locale('es', 'MX'),
                value: AppLocale.esMx,
                child: Text('Español Mexico'),
              ),
            ],
            onChanged: (locale) {
              // if (locale != null) {
              //   appState?.changeLanguage(locale);
              // }
              if (locale != null) {
                LocaleSettings.setLocale(locale);
                if (locale.countryCode?.isNotEmpty ?? false) {
                  Intl.defaultLocale =
                      '${locale.languageCode}_${locale.countryCode}';
                } else {
                  Intl.defaultLocale = locale.languageCode;
                }
              }
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (_, index) {
          final product = list[index];
          return ProductTile(product: product);
        },
        itemCount: list.length,
      ),
    );
  }
}
