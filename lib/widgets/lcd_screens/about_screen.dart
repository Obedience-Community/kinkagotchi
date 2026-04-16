import 'package:flutter/material.dart';
import '../../services/button_service.dart';
import '../../services/lcd_screen_service.dart';
import 'main_menu.dart';

/// About screen that displays information about the app
class AboutScreen extends StatefulWidget {
  final LcdScreenService screenService;
  final ButtonService buttonService;

  const AboutScreen({
    super.key,
    required this.screenService,
    required this.buttonService,
  });

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    // Register button A callback to go back to menu
    widget.buttonService.setButtonCallbacks(onA: _goBackToMenu);
  }

  @override
  void dispose() {
    // Clear button callbacks when leaving this screen
    widget.buttonService.clearButtonCallbacks();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'ABOUT',
                    style: TextStyle(
                      color: Color(0xFF2B2B2B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Kinkagotchi',
                    style: TextStyle(
                      color: Color(0xFF2B2B2B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'A virtual pet game\nmade by the Obedience\nDiscord server\ncommunity.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2B2B2B),
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Navigation hint at the bottom
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Text('BACK', style: TextStyle(fontSize: 10)),
                  Icon(Icons.arrow_downward, size: 12),
                ],
              ),
              Column(
                children: const [
                  Text('', style: TextStyle(fontSize: 10)),
                  Icon(Icons.arrow_upward, size: 12, color: Colors.transparent),
                ],
              ),
              Column(
                children: const [
                  Text('', style: TextStyle(fontSize: 10)),
                  Icon(
                    Icons.arrow_downward,
                    size: 12,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _goBackToMenu() {
    widget.screenService.replaceScreen(
      MainMenu(
        screenService: widget.screenService,
        buttonService: widget.buttonService,
        initialSelectedIndex: 0,
        onSelect: _handleMenuSelect,
      ),
    );
  }

  void _handleMenuSelect(int selectedIndex) {
    if (selectedIndex == 0) {
      // ABOUT selected
      widget.screenService.replaceScreen(
        AboutScreen(
          screenService: widget.screenService,
          buttonService: widget.buttonService,
        ),
      );
    } else if (selectedIndex == 1) {
      // START selected
      // TODO: Navigate to game screen
    }
  }
}
