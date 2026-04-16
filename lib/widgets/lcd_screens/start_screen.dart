import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/button_service.dart';
import '../../services/lcd_screen_service.dart';
import 'main_menu.dart';

/// Start screen shown on app startup - the main welcome screen
class StartScreen extends StatefulWidget {
  final LcdScreenService screenService;
  final ButtonService buttonService;

  const StartScreen({
    super.key,
    required this.screenService,
    required this.buttonService,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late Timer _transitionTimer;

  @override
  void initState() {
    super.initState();
    // Transition to main menu after 5 seconds
    _transitionTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        widget.screenService.replaceScreen(
          MainMenu(
            screenService: widget.screenService,
            buttonService: widget.buttonService,
            initialSelectedIndex: 0,
            onSelect: _handleMenuSelect,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _transitionTimer.cancel();
    super.dispose();
  }

  void _handleMenuSelect(int selectedIndex) {
    // Handle menu selection
    if (selectedIndex == 0) {
      // ABOUT selected
      // TODO: Navigate to about screen
    } else if (selectedIndex == 1) {
      // START selected
      // TODO: Navigate to game screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Made by the Obedience\nDiscord server\ncommunity.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF2B2B2B),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
