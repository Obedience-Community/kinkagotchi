import 'package:flutter/material.dart';

/// Displays button function labels at the bottom of the LCD display
/// Shows which action each button (A, B, C) performs on the current screen
class ButtonLabelsStrip extends StatelessWidget {
  final String labelA;
  final String labelB;
  final String labelC;

  const ButtonLabelsStrip({
    super.key,
    this.labelA = '',
    this.labelB = '',
    this.labelC = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF9EAB91), // Match LCD background
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Button A
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2B2B2B), width: 1.5),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Center(
                child: Text(
                  labelA,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4.0),
          // Button B
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2B2B2B), width: 1.5),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Center(
                child: Text(
                  labelB,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4.0),
          // Button C
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2B2B2B), width: 1.5),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Center(
                child: Text(
                  labelC,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
