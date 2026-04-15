import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/button_service.dart';
import '../services/keyboard_service.dart';
import '../widgets/lcd_display.dart';
import '../widgets/egg_shape.dart';
import '../widgets/button.dart';

/// HomePage is a StatefulWidget that displays the main game interface
/// and handles keyboard input for button actions
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode _focusNode;
  late Logger _logger;
  late ButtonService _buttonService;
  late KeyboardService _keyboardService;

  @override
  void initState() {
    super.initState();
    _logger = Logger();
    _focusNode = FocusNode();
    _buttonService = ButtonService(logger: _logger);
    _keyboardService = KeyboardService(buttonService: _buttonService);

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
    _keyboardService.handleKeyPress(event);
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
                                    _logger.i('Button A Pressed');
                                    _buttonService.triggerButtonA();
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
                                    _logger.i('Button B Pressed');
                                    _buttonService.triggerButtonB();
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
                                    _logger.i('Button C Pressed');
                                    _buttonService.triggerButtonC();
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
