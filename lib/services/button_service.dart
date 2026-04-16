import 'package:logger/logger.dart';
import '../widgets/lcd_screens/menu_screen.dart';

/// Service that handles button actions
class ButtonService {
  final Logger logger;
  MenuScreenState? _currentMenuState;

  // Callbacks for non-menu screens
  Function()? _onButtonAPressed;
  Function()? _onButtonBPressed;
  Function()? _onButtonCPressed;

  ButtonService({required this.logger});

  /// Set the current menu state (called by menu screens)
  void setCurrentMenuState(MenuScreenState? menuState) {
    _currentMenuState = menuState;
    // Clear callbacks when switching to menu
    if (menuState != null) {
      _onButtonAPressed = null;
      _onButtonBPressed = null;
      _onButtonCPressed = null;
    }
  }

  /// Set custom button callbacks for non-menu screens
  void setButtonCallbacks({Function()? onA, Function()? onB, Function()? onC}) {
    _onButtonAPressed = onA;
    _onButtonBPressed = onB;
    _onButtonCPressed = onC;
    // Clear menu state when setting custom callbacks
    _currentMenuState = null;
  }

  /// Clear button callbacks
  void clearButtonCallbacks() {
    _onButtonAPressed = null;
    _onButtonBPressed = null;
    _onButtonCPressed = null;
  }

  /// Trigger Button A action (SELECT)
  void triggerButtonA() {
    logger.i('Button A triggered (SELECT)');
    // If custom callback is set, use it; otherwise use menu action
    if (_onButtonAPressed != null) {
      _onButtonAPressed!();
    } else if (_currentMenuState?.mounted ?? false) {
      _currentMenuState?.selectCurrentOption();
    }
  }

  /// Trigger Button B action (UP in menus)
  void triggerButtonB() {
    logger.i('Button B triggered (UP)');
    // If custom callback is set, use it; otherwise use menu action
    if (_onButtonBPressed != null) {
      _onButtonBPressed!();
    } else if (_currentMenuState?.mounted ?? false) {
      _currentMenuState?.moveSelectionUp();
    }
  }

  /// Trigger Button C action (DOWN in menus)
  void triggerButtonC() {
    logger.i('Button C triggered (DOWN)');
    // If custom callback is set, use it; otherwise use menu action
    if (_onButtonCPressed != null) {
      _onButtonCPressed!();
    } else if (_currentMenuState?.mounted ?? false) {
      _currentMenuState?.moveSelectionDown();
    }
  }
}
