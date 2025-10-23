import 'package:flutter/material.dart';
import 'widgets/lcd_display.dart';

const Color darkGray = Color(0xFF222222);

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
      // The application title
      title: 'Kinkagotchi',

      // Define the primary visual theme of the app
      theme: ThemeData(
        primarySwatch: Colors.red,
        // Using a clean, modern font for the app
        fontFamily: 'Inter',
        scaffoldBackgroundColor: darkGray,
      ),

      // Define the home screen of the application
      home: const MyHomePage(title: 'Kinkagotchi'),
    );
  }
}

// MyHomePage is a Stateless Widget that represents the main screen content.
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top bar of the app
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.grey.shade300,
        elevation: 4,
      ),
      body: const SafeArea(
        child: Center(
          // Center widget added here
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: LcdDisplay(),
          ),
        ),
      ),
    );
  }
}
