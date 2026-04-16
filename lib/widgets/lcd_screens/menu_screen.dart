import 'package:flutter/material.dart';

/// Base class for menu screens
/// Provides common menu functionality like selection and navigation
class MenuScreen extends StatefulWidget {
  final List<String> options;
  final int initialSelectedIndex;
  final Function(int) onSelect;
  final GlobalKey<MenuScreenState>? menuKey;

  const MenuScreen({
    super.key,
    required this.options,
    this.initialSelectedIndex = 0,
    required this.onSelect,
    this.menuKey,
  });

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  /// Get the currently selected index
  int get selectedIndex => _selectedIndex;

  void moveSelectionUp() {
    setState(() {
      if (_selectedIndex > 0) {
        _selectedIndex--;
      } else {
        // Wrap to bottom
        _selectedIndex = widget.options.length - 1;
      }
    });
  }

  void moveSelectionDown() {
    setState(() {
      if (_selectedIndex < widget.options.length - 1) {
        _selectedIndex++;
      } else {
        // Wrap to top
        _selectedIndex = 0;
      }
    });
  }

  void selectCurrentOption() {
    widget.onSelect(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedIndex;
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                color: isSelected
                    ? const Color(0xFF2B2B2B) // Dark background when selected
                    : Colors.transparent,
                child: Text(
                  widget.options[index],
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF9EAB91) // LCD green when selected
                        : const Color(
                            0xFF2B2B2B,
                          ), // Dark text when not selected
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Navigation hints at the bottom
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Text('SEL', style: TextStyle(fontSize: 10)),
                  Icon(Icons.arrow_downward, size: 12),
                ],
              ),
              Column(
                children: const [
                  Text('UP', style: TextStyle(fontSize: 10)),
                  Icon(Icons.arrow_upward, size: 12),
                ],
              ),
              Column(
                children: const [
                  Text('DOWN', style: TextStyle(fontSize: 10)),
                  Icon(Icons.arrow_downward, size: 12),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
