import 'package:flutter/material.dart';

class LcdDisplay extends StatelessWidget {
  const LcdDisplay({
    super.key,
    this.backgroundColor = const Color(0xFF9EAB91), // Classic LCD green-gray
    this.borderColor = const Color(0xFF4A4A4A), // Dark gray border
    this.textColor = const Color(0xFF2B2B2B), // Dark text color
    this.borderWidth = 8.0, // Thick border for retro look
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate 60% of available width
        final displayWidth = constraints.maxWidth * 0.6;
        // Calculate height based on 4:3 ratio
        final displayHeight = displayWidth * (3 / 4);

        return Center(
          child: Container(
            width: displayWidth,
            height: displayHeight,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
              // Add inset shadow for depth
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(-1, -1),
                ),
              ],
            ),
            // Add scanlines effect
            child: CustomPaint(
              painter: ScanlinePainter(),
              child: const Center(
                child: Text(
                  'Made by the Obedience Discord server community.',
                  style: TextStyle(
                    color: Color(0xFF2B2B2B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ScanlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..strokeWidth = 1;

    // Draw horizontal scanlines
    for (double i = 0; i < size.height; i += 2) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
