import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'pages/home_page.dart';

// The main function is the entry point of the application.
void main() {
  runApp(const MyApp());
}

// MyApp is a Stateless Widget, which is the root of our application.
// It sets up the basic material design structure.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appTitle,
      theme: AppConfig.getAppTheme(),
      home: const HomePage(title: AppConfig.appTitle),
    );
  }
}
