import 'package:flutter/material.dart';

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
      title: 'Hello World App',
      
      // Define the primary visual theme of the app
      theme: ThemeData(
        primarySwatch: Colors.red[900],
        // Using a clean, modern font for the app
        fontFamily: 'Inter', 
      ),
      
      // Define the home screen of the application
      home: const MyHomePage(title: 'Flutter Hello World'),
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
        backgroundColor: Colors.blueGrey,
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
              // Display the "Hello World!" text in a large, clean style
              Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 48, // Large font size
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              
              SizedBox(height: 16),
              
              // A simple, secondary message
              Text(
                'Welcome to your first Flutter application!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
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
