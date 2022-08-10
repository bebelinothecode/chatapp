import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;
  static const accentColor = AppColors.accent;
  static const card = AppColors.cardDark;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  static ThemeData  light() => ThemeData(
    brightness: Brightness.light,
    // colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme: GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
    backgroundColor: _LightColors.background,
    scaffoldBackgroundColor: _LightColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppColors.secondary),
    ),
    cardColor: _LightColors.background,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppColors.textDark),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconDark),
  );

  /// Dark theme and its settings.
  static ThemeData  dark() => ThemeData(
    brightness: Brightness.dark,
    visualDensity: visualDensity,
    textTheme:
    GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLight),
    backgroundColor: _DarkColors.background,
    scaffoldBackgroundColor: _DarkColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppColors.secondary),
    ),
    cardColor: _DarkColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppColors.textLight),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconLight),
  );
}