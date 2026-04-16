# LCD Screen Management System

## Overview
The LCD screen system allows you to easily manage different screens (animations, menus, game states) on the game's LCD display.

## Architecture

### Components

1. **LcdScreenService** (`lib/services/lcd_screen_service.dart`)
   - Manages the current screen being displayed
   - Provides navigation methods
   - Uses `ChangeNotifier` for reactive updates

2. **LcdScreenContent** (abstract base class)
   - Base class for all screen types
   - Extends `StatelessWidget`
   - All screens must inherit from this

3. **LcdDisplay** (`lib/widgets/lcd_display.dart`)
   - The visual LCD frame widget
   - Takes a `LcdScreenService` and listens for screen changes
   - Automatically re-renders when screen changes

4. **StartScreen** (`lib/widgets/lcd_screens/start_screen.dart`)
   - The default start/home screen shown on app startup

## How to Use

### 1. Create a New Screen
Create a new file in `lib/widgets/lcd_screens/`:

```dart
// lib/widgets/lcd_screens/game_screen.dart
import 'package:flutter/material.dart';
import '../../services/lcd_screen_service.dart';

class GameScreen extends LcdScreenContent {
  final int health;
  final int energy;

  const GameScreen({
    super.key,
    required this.health,
    required this.energy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Health: $health'),
        Text('Energy: $energy'),
      ],
    );
  }
}
```

### 2. Navigate Between Screens
In your `ButtonService` or any other part of your app, inject `LcdScreenService`:

```dart
// Show a new screen (adds current to history)
_screenService.showScreen(GameScreen(health: 100, energy: 80));

// Replace screen without adding to history
_screenService.replaceScreen(GameScreen(health: 50, energy: 30));

// Go back to previous screen
_screenService.goBack();

// Clear history and show start screen
screenService.clearHistoryAndShowScreen(const StartScreen());
```

### 3. Available Methods

```dart
// Show a new screen (keeps history)
screenService.showScreen(MyScreen());

// Replace current screen (no history)
screenService.replaceScreen(MyScreen());

// Go back to previous screen
screenService.goBack();

// Check if can go back
if (screenService.canGoBack) {
  screenService.goBack();
}

// Clear all history
screenService.clearHistoryAndShowScreen(const StartScreen());

// Get current screen
var current = screenService.currentScreen;

// Check history length (debug)
print('History: ${screenService.historyLength}');
```

## Example Screens

### Animation Screen
```dart
class AnimationScreen extends LcdScreenContent {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 2),
        builder: (context, value, child) {
          return Opacity(opacity: value, child: child);
        },
        child: Text('Animation!'),
      ),
    );
  }
}
```

### Menu Screen
```dart
class MenuScreen extends LcdScreenContent {
  final Function(String) onMenuSelect;

  const MenuScreen({
    super.key,
    required this.onMenuSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onMenuSelect('play'),
          child: Text('Play'),
        ),
        GestureDetector(
          onTap: () => onMenuSelect('settings'),
          child: Text('Settings'),
        ),
      ],
    );
  }
}
```

### Game Status Screen
```dart
class GameStatusScreen extends LcdScreenContent {
  final int level;
  final int score;

  const GameStatusScreen({
    super.key,
    required this.level,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Level: $level'),
        Text('Score: $score'),
      ],
    );
  }
}
```

## Integration with Buttons

You can trigger screen changes from button presses:

```dart
// In ButtonService
class ButtonService {
  final LcdScreenService screenService;
  
  ButtonService({required this.screenService});
  
  void triggerButtonA() {
    // Change to game screen
    screenService.showScreen(GameScreen());
  }
  
  void triggerButtonB() {
    // Show menu
    screenService.showScreen(MenuScreen());
  }
  
  void triggerButtonC() {
    // Go back
    if (screenService.canGoBack) {
      screenService.goBack();
    }
  }
}
```

## Important Notes

✅ **Screens are stateless** - If you need state, manage it outside and pass as parameters
✅ **Reactive updates** - Uses `ListenableBuilder` to automatically update when screen changes
✅ **History navigation** - Use `showScreen()` for menu-like navigation, `replaceScreen()` for direct transitions
✅ **Flexible content** - Screens can be simple text, complex animations, or anything else

## Future Enhancements

- Add screen transition animations
- Implement screen stack/navigation graph
- Add screen state persistence
- Create screen factory pattern
