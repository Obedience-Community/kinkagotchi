import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

// MyHomePage is now a StatefulWidget to handle keyboard input
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    // Request focus so the widget can receive keyboard input
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent) {
      final key = event.logicalKey;

      // Handle A key
      if (key == LogicalKeyboardKey.keyA) {
        logger.i('Button A Pressed (keyboard)');
        _triggerButtonA();
      }
      // Handle B key
      else if (key == LogicalKeyboardKey.keyB) {
        logger.i('Button B Pressed (keyboard)');
        _triggerButtonB();
      }
      // Handle C key
      else if (key == LogicalKeyboardKey.keyC) {
        logger.i('Button C Pressed (keyboard)');
        _triggerButtonC();
      }
    }
  }

  void _triggerButtonA() {
    logger.i('Button A triggered');
    // Add your button A logic here
  }

  void _triggerButtonB() {
    logger.i('Button B triggered');
    // Add your button B logic here
  }

  void _triggerButtonC() {
    logger.i('Button C triggered');
    // Add your button C logic here
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyPress,
      child: Scaffold(
        // Top bar of the app
        appBar: AppBar(
          title: Text(widget.title),
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
                                  onPressed: () {
                                    logger.i('Button A Pressed');
                                    _triggerButtonA();
                                  },
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
                                  onPressed: () {
                                    logger.i('Button B Pressed');
                                    _triggerButtonB();
                                  },
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
                                  onPressed: () {
                                    logger.i('Button C Pressed');
                                    _triggerButtonC();
                                  },
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
      ),
    );
  }
}
