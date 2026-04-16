import 'package:flutter/material.dart';

/// Service that manages what's currently displayed on the LCD screen
/// Allows you to switch between different screens (menus, animations, game states, etc.)
class LcdScreenService extends ChangeNotifier {
  Widget _currentScreen;
  final List<Widget> _screenHistory = [];

  LcdScreenService({required Widget initialScreen})
    : _currentScreen = initialScreen;

  /// Get the current screen being displayed
  Widget get currentScreen => _currentScreen;

  /// Show a new screen and add previous to history
  void showScreen(Widget screen) {
    _screenHistory.add(_currentScreen);
    _currentScreen = screen;
    notifyListeners();
  }

  /// Replace current screen without adding to history
  void replaceScreen(Widget screen) {
    _currentScreen = screen;
    notifyListeners();
  }

  /// Go back to the previous screen if history exists
  void goBack() {
    if (_screenHistory.isNotEmpty) {
      _currentScreen = _screenHistory.removeLast();
      notifyListeners();
    }
  }

  /// Clear history and show a new screen
  void clearHistoryAndShowScreen(Widget screen) {
    _screenHistory.clear();
    _currentScreen = screen;
    notifyListeners();
  }

  /// Get screen history length (useful for debugging)
  int get historyLength => _screenHistory.length;

  /// Check if there's a previous screen to go back to
  bool get canGoBack => _screenHistory.isNotEmpty;
}
