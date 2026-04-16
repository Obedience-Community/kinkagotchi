import 'package:flutter/material.dart';
import '../../services/button_service.dart';
import '../../services/lcd_screen_service.dart';
import 'menu_screen.dart';

/// The main menu shown after the start screen
/// Options: ABOUT, START
class MainMenu extends MenuScreen {
  final LcdScreenService screenService;
  final ButtonService buttonService;

  MainMenu({
    super.key,
    super.initialSelectedIndex,
    required super.onSelect,
    required this.screenService,
    required this.buttonService,
  }) : super(
         options: const ['ABOUT', 'START'],
         menuKey: GlobalKey<MenuScreenState>(),
       ) {
    // Register this menu with the button service
    buttonService.setCurrentMenuState(menuKey?.currentState);
  }
}
