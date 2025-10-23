import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String eggSvgString = '''
<svg width="100" height="127" viewBox="0 0 100 127" xmlns="http://www.w3.org/2000/svg">
  <path d="M50 2 C30 2 15 20 10 40 C5 60 2 85 2 100 C2 115 20 125 50 125 C80 125 98 115 98 100 C98 85 95 60 90 40 C85 20 70 2 50 2" fill="currentColor"/>
</svg>
''';

class EggShape extends StatelessWidget {
  const EggShape({
    super.key,
    this.color = const Color(0xFFB71C1C), // Colors.red.shade900
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * 0.85;
        // SVG aspect ratio is 100:127
        final height = width * 1.27;

        return SizedBox(
          width: width,
          height: height,
          child: SvgPicture.string(
            eggSvgString,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        );
      },
    );
  }
}
