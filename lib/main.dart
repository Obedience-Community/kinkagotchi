import 'package:flutter/material.dart';
import 'widgets/lcd_display.dart';
import 'widgets/egg_shape.dart';

const Color darkGray = Color(0xFF222222);
const String eggAssetPath = 'assets/egg.svg';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                final screenHeight =
                    constraints.maxHeight; // 👈 Get the available height

                // 1. Calculate Egg Dimensions
                // Egg width is 90% of screen width
                final eggWidth = screenWidth * 0.90;

                // Calculate the maximum allowed height for the egg (95% of screen height)
                final maxEggHeight = screenHeight * 0.95; // 👈 NEW CONSTRAINT

                // LCD Dimensions
                final lcdWidth = eggWidth * 0.85;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // 2. The EggShape (Base layer, 90% width, MAX 95% height)
                    ConstrainedBox(
                      // 👈 Use ConstrainedBox to enforce max height
                      constraints: BoxConstraints(
                        maxHeight: maxEggHeight, // Set the maximum height
                        // We also set the minimum and maximum width to be the calculated eggWidth
                        minWidth: eggWidth,
                        maxWidth: eggWidth,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: EggShape(),
                      ),
                    ),

                    // 3. The LCD Display (Overlay layer)
                    SizedBox(
                      width: lcdWidth,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 100),
                        child: LcdDisplay(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
