import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'widgets/lcd_display.dart';
import 'widgets/egg_shape.dart';
import 'widgets/button.dart';

const Color darkGray = Color(0xFF222222);
const String eggAssetPath = 'assets/egg.svg';

final logger = Logger();

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
                final screenHeight = constraints.maxHeight;

                final eggWidth = screenWidth * 0.90;
                final maxEggHeight = screenHeight * 0.95;
                final lcdWidth = eggWidth * 0.85;

                // The button radius is defined here to size the button row
                const double buttonRadius = 28;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // 1. The EggShape (Base layer, 90% width, MAX 80% height)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: maxEggHeight,
                        minWidth: eggWidth,
                        maxWidth: eggWidth,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: EggShape(),
                      ),
                    ),

                    // 2. The Overlay Content (LCD + Buttons)
                    // We use a Column to stack the LCD and Buttons vertically,
                    // and the Stack's alignment: Alignment.center centers this Column
                    // over the EggShape.
                    Column(
                      mainAxisSize: MainAxisSize
                          .min, // Essential: only take up needed space
                      children: [
                        // A. LCD Display
                        SizedBox(
                          width: lcdWidth,
                          // Adjust vertical position UPWARD with negative padding (bottom)
                          // or use a precise Alignment(x, y) if needed.
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                            ), // Adjust this if needed
                            child: LcdDisplay(),
                          ),
                        ),

                        // Space between LCD and buttons
                        const SizedBox(height: 32),

                        // B. The Button Row (Constrained width)
                        // 👈 NEW: Constrain the button Row's width to 80% of the LCD width
                        SizedBox(
                          width: lcdWidth * 0.70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Button A
                              Button(
                                onPressed: () => logger.i('Button A Pressed'),
                                radius: buttonRadius,
                                child: const Text(
                                  'A',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // Button B
                              Button(
                                onPressed: () => logger.i('Button B Pressed'),
                                radius: buttonRadius,
                                child: const Text(
                                  'B',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // Button C
                              Button(
                                onPressed: () => logger.i('Button C Pressed'),
                                radius: buttonRadius,
                                child: const Text(
                                  'C',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
