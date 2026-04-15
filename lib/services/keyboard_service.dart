import 'package:flutter/services.dart';
import 'button_service.dart';

/// Service that handles keyboard input and maps it to button actions
class KeyboardService {
  final ButtonService buttonService;

  KeyboardService({required this.buttonService});

  /// Handle keyboard key press events
  /// Maps keys A, B, C to their corresponding button actions
  void handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent) {
      final key = event.logicalKey;

      // Handle A key
      if (key == LogicalKeyboardKey.keyA) {
        buttonService.triggerButtonA();
      }
      // Handle B key
      else if (key == LogicalKeyboardKey.keyB) {
        buttonService.triggerButtonB();
      }
      // Handle C key
      else if (key == LogicalKeyboardKey.keyC) {
        buttonService.triggerButtonC();
      }
    }
  }
}
