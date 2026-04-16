import 'package:logger/logger.dart';
import '../widgets/lcd_screens/menu_screen.dart';

/// Service that handles button actions
class ButtonService {
  final Logger logger;
  MenuScreenState? _currentMenuState;

  ButtonService({required this.logger});

  /// Set the current menu state (called by menu screens)
  void setCurrentMenuState(MenuScreenState? menuState) {
    _currentMenuState = menuState;
  }

  /// Trigger Button A action (SELECT)
  void triggerButtonA() {
    logger.i('Button A triggered (SELECT)');
    // If we're in a menu, select the current option
    _currentMenuState?.selectCurrentOption();
  }

  /// Trigger Button B action (UP in menus)
  void triggerButtonB() {
    logger.i('Button B triggered (UP)');
    // If we're in a menu, move selection up
    _currentMenuState?.moveSelectionUp();
  }

  /// Trigger Button C action (DOWN in menus)
  void triggerButtonC() {
    logger.i('Button C triggered (DOWN)');
    // If we're in a menu, move selection down
    _currentMenuState?.moveSelectionDown();
  }
}
