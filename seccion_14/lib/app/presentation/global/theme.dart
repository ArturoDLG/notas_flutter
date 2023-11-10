import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData getTheme(bool darkMode) {
  if (darkMode) {
    final darkTheme = ThemeData.dark();
    final textTheme = darkTheme.textTheme;
    const bolsStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );
    const whiteStyle = TextStyle(
      color: Colors.white,
    );
    return darkTheme.copyWith(
      textTheme: GoogleFonts.nunitoSansTextTheme(
        textTheme.copyWith(
          titleSmall: textTheme.titleSmall?.merge(bolsStyle),
          titleMedium: textTheme.titleMedium?.merge(bolsStyle),
          titleLarge: textTheme.titleLarge?.merge(bolsStyle),
          bodySmall: textTheme.bodySmall?.merge(whiteStyle),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.dark,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.darkLigth,
      canvasColor: AppColors.dark,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(
          Colors.lightBlue.withOpacity(0.5),
        ),
        thumbColor: MaterialStateProperty.all(
          Colors.blue,
        ),
      ),
    );
  }
  final lightTheme = ThemeData.light();
  final textTheme = lightTheme.textTheme;
  const bolsStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
  );
  const darkStyle = TextStyle(
    color: AppColors.dark,
  );
  return lightTheme.copyWith(
    textTheme: GoogleFonts.nunitoSansTextTheme(
      textTheme.copyWith(
        titleSmall: textTheme.titleSmall?.merge(bolsStyle),
        titleMedium: textTheme.titleMedium?.merge(bolsStyle),
        titleLarge: textTheme.titleLarge?.merge(bolsStyle),
        bodySmall: textTheme.bodySmall?.merge(darkStyle),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.dark,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.dark,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.dark,
    ),
  );
}
