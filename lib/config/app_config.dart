import 'package:flutter/material.dart';

/// App-wide configuration constants
class AppConfig {
  // Colors
  static const Color darkGray = Color(0xFF222222);
  static const Color primaryRed = Color(0xFFB71C1C);

  // Assets
  static const String eggAssetPath = 'assets/egg.svg';

  // App Information
  static const String appTitle = 'Kinkagotchi';
  static const String appDescription =
      'Nurture your kinky pet with tasks, rewards, and punishments.';

  // Theme Configuration
  static ThemeData getAppTheme() {
    return ThemeData(
      primarySwatch: Colors.red,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: darkGray,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.grey.shade300,
        elevation: 4,
      ),
    );
  }
}
