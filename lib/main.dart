import 'package:flutter/material.dart';

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
      
      // Body content is centered in the screen
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            // Vertically center the content
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display the "Hello Kinkagotchi!" text in a large, clean style
              Text(
                'Hello Kinkagotchi!',
                style: TextStyle(
                  fontSize: 48, // Large font size
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              
              SizedBox(height: 16),
              
              // A simple, secondary message
              Text(
                'Made by the Obedience App community.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}