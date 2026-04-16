import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:kinkagotchi/services/button_service.dart';
import 'package:kinkagotchi/widgets/lcd_screens/menu_screen.dart';

void main() {
  group('Menu Navigation', () {
    late ButtonService buttonService;
    late MenuScreenState menuState;

    setUp(() {
      buttonService = ButtonService(logger: Logger());
    });

    testWidgets('Menu up/down navigation works correctly', (
      WidgetTester tester,
    ) async {
      final menuKey = GlobalKey<MenuScreenState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuScreen(
              key: menuKey,
              options: const ['OPTION 1', 'OPTION 2', 'OPTION 3'],
              initialSelectedIndex: 0,
              onSelect: (_) {},
              menuKey: menuKey,
            ),
          ),
        ),
      );

      menuState = menuKey.currentState!;
      buttonService.setCurrentMenuState(menuState);

      // Initial state: first option selected
      expect(menuState.selectedIndex, 0);

      // Press button C (DOWN) - should move to next option
      buttonService.triggerButtonC();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuScreen(
              key: menuKey,
              options: const ['OPTION 1', 'OPTION 2', 'OPTION 3'],
              initialSelectedIndex: 0,
              onSelect: (_) {},
              menuKey: menuKey,
            ),
          ),
        ),
      );
      expect(menuState.selectedIndex, 1);

      // Press button C (DOWN) again
      buttonService.triggerButtonC();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuScreen(
              key: menuKey,
              options: const ['OPTION 1', 'OPTION 2', 'OPTION 3'],
              initialSelectedIndex: 0,
              onSelect: (_) {},
              menuKey: menuKey,
            ),
          ),
        ),
      );
      expect(menuState.selectedIndex, 2);

      // Press button B (UP) - should move back up
      buttonService.triggerButtonB();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuScreen(
              key: menuKey,
              options: const ['OPTION 1', 'OPTION 2', 'OPTION 3'],
              initialSelectedIndex: 0,
              onSelect: (_) {},
              menuKey: menuKey,
            ),
          ),
        ),
      );
      expect(menuState.selectedIndex, 1);
    });

    testWidgets('Menu wraps around at edges', (WidgetTester tester) async {
      final menuKey = GlobalKey<MenuScreenState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuScreen(
              key: menuKey,
              options: const ['OPTION 1', 'OPTION 2'],
              initialSelectedIndex: 0,
              onSelect: (_) {},
              menuKey: menuKey,
            ),
          ),
        ),
      );

      menuState = menuKey.currentState!;
      buttonService.setCurrentMenuState(menuState);

      // Press button B (UP) at the top - should wrap to bottom
      buttonService.triggerButtonB();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuScreen(
              key: menuKey,
              options: const ['OPTION 1', 'OPTION 2'],
              initialSelectedIndex: 0,
              onSelect: (_) {},
              menuKey: menuKey,
            ),
          ),
        ),
      );
      expect(menuState.selectedIndex, 1);

      // Press button C (DOWN) at the bottom - should wrap to top
      buttonService.triggerButtonC();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuScreen(
              key: menuKey,
              options: const ['OPTION 1', 'OPTION 2'],
              initialSelectedIndex: 0,
              onSelect: (_) {},
              menuKey: menuKey,
            ),
          ),
        ),
      );
      expect(menuState.selectedIndex, 0);
    });
  });
}
