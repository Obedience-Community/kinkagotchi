import 'package:logger/logger.dart';

/// Service that handles button actions
class ButtonService {
  final Logger logger;

  ButtonService({required this.logger});

  /// Trigger Button A action
  void triggerButtonA() {
    logger.i('Button A triggered');
    // Add your button A logic here
  }

  /// Trigger Button B action
  void triggerButtonB() {
    logger.i('Button B triggered');
    // Add your button B logic here
  }

  /// Trigger Button C action
  void triggerButtonC() {
    logger.i('Button C triggered');
    // Add your button C logic here
  }
}
