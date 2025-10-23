import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final double radius; // Define radius for the button
  final Color baseColor; // Base color for the button
  final double borderWidth; // Thickness of the "inset" border

  const Button({
    Key? key,
    required this.onPressed,
    this.child,
    this.radius = 60.0, // Default radius
    this.baseColor = Colors.amber, // Default gold/amber color
    this.borderWidth = 8.0, // Default border thickness
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(
        radius,
      ), // Makes the ripple effect round
      child: Container(
        width: radius * 2, // Diameter
        height: radius * 2, // Diameter
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // Gradient to give a slightly convex/3D look
          gradient: RadialGradient(
            colors: [
              baseColor.withOpacity(0.9), // Slightly lighter center
              baseColor,
              baseColor.withOpacity(0.8), // Slightly darker edge
            ],
            stops: [0.0, 0.5, 1.0],
          ),
          // Inner shadow for the "inset" effect
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6), // Dark shadow for depth
              offset: Offset(2, 2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(
                0.3,
              ), // Light highlight for contrast
              offset: Offset(-2, -2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: child, // Place any child widget here (e.g., an icon or text)
        ),
      ),
    );
  }
}
