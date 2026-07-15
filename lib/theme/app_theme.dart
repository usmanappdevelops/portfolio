import 'package:flutter/material.dart';

/// Centralized theme/design tokens for the portfolio app.
class AppColors {
  static const Color primaryDark = Color(0xFF0B1E3D);   // deep navy
  static const Color primaryBlue = Color(0xFF1565C0);   // strong blue
  static const Color accentCyan = Color(0xFF29D3E0);    // bright cyan accent
  static const Color background = Color(0xFF0A0E1A);    // near-black bg
  static const Color surface = Color(0xFF121A2B);        // card surface
  static const Color surfaceLight = Color(0xFF1B2740);   // lighter card
  static const Color textPrimary = Color(0xFFF5F7FA);
  static const Color textSecondary = Color(0xFFAAB4C5);
  static const Color divider = Color(0xFF223052);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentCyan, primaryBlue, primaryDark],
  );
}

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primaryBlue,
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryBlue,
        secondary: AppColors.accentCyan,
        surface: AppColors.surface,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: AppColors.textSecondary, height: 1.5),
        bodyMedium: TextStyle(color: AppColors.textSecondary, height: 1.5),
      ),
    );
  }
}

/// Simple breakpoints for responsive layout.
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double contentMaxWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 1200 ? 1100 : width * 0.92;
  }
}
