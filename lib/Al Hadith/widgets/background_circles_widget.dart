import 'package:flutter/material.dart';
import '../../Core Components/colors.dart';

class BackgroundCirclesWidget extends StatelessWidget {
  final Color primaryColor;
  final double? verticalOffset;

  const BackgroundCirclesWidget({
    super.key,
    required this.primaryColor,
    this.verticalOffset = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ..._buildLargeBackgroundCircles(size),
        ..._buildSmallCircles(size),
      ],
    );
  }

  List<Widget> _buildLargeBackgroundCircles(Size size) {
    return [
      Positioned(
        top: -size.width * 0.42 + verticalOffset!,
        right: -size.width * 0.25,
        child: Container(
          width: size.width * 1.48,
          height: size.width * 1.48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.1),
          ),
        ),
      ),
      Positioned(
        top: -size.width * 0.4 + verticalOffset!,
        left: -size.width * 0.2,
        child: Container(
          width: size.width * 1.4,
          height: size.width * 1.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.15),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildSmallCircles(Size size) {
    List<Widget> circles = [];
    final positions = [
      {'top': size.height * 0.06, 'right': size.width * 0.03, 'size': 40.0},
      {'top': size.height * 0.15, 'right': size.width * 0.15, 'size': 40.0},
      {'top': size.height * 0.15, 'right': size.width * 0.56, 'size': 40.0},
      {'top': size.height * 0.22, 'right': size.width * 0.25, 'size': 25.0},
      {'top': size.height * 0.25, 'right': -size.width * 0.03, 'size': 25.0},
      {'top': size.height * 0.34, 'right': size.width * 0.15, 'size': 25.0},
      {'top': size.height * 0.25, 'right': size.width * 0.45, 'size': 25.0},
      {'top': size.height * 0.37, 'right': size.width * 0.48, 'size': 25.0},
      {'top': size.height * 0.08, 'left': size.width * 0.15, 'size': 15.0},
      {'top': size.height * 0.15, 'left': size.width * 0.08, 'size': 15.0},
      {'top': size.height * 0.20, 'left': size.width * 0.2, 'size': 15.0},
      {'top': size.height * 0.3, 'left': size.width * 0.08, 'size': 15.0},
    ];

    for (var pos in positions) {
      circles.add(
        Positioned(
          top: (pos['top'] as double) + verticalOffset!,
          left: pos['left'],
          right: pos['right'],
          child: Container(
            width: pos['size'] as double,
            height: pos['size'] as double,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.25),
            ),
          ),
        ),
      );
    }

    return circles;
  }
}

class WarningBackgroundCirclesWidget extends StatelessWidget {
  final Color primaryColor;
  final double? verticalOffset;

  const WarningBackgroundCirclesWidget({
    super.key,
    required this.primaryColor,
    this.verticalOffset = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ..._buildLargeBackgroundCircles(size),
        ..._buildSmallCircles(size),
      ],
    );
  }

  List<Widget> _buildLargeBackgroundCircles(Size size) {
    return [
      Positioned(
        top: -size.width * 0.42 + verticalOffset!,
        right: -size.width * 0.25,
        child: Container(
          width: size.width * 1.5,
          height: size.width * 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 197, 255, 181).withOpacity(0.2),
                primaryColor.withOpacity(0.2),
              ],
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      Positioned(
        top: -size.width * 0.4 + verticalOffset!,
        left: -size.width * 0.2,
        child: Container(
          width: size.width * 1.4,
          height: size.width * 1.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color(0xFFF4FFF1).withOpacity(0.2),
                primaryColor.withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildSmallCircles(Size size) {
    List<Widget> circles = [];
    final positions = [
      {'top': size.height * 0.06, 'right': size.width * 0.03, 'size': 40.0},
      {'top': size.height * 0.15, 'right': size.width * 0.15, 'size': 40.0},
      {'top': size.height * 0.15, 'right': size.width * 0.56, 'size': 40.0},
      {'top': size.height * 0.22, 'right': size.width * 0.25, 'size': 25.0},
      {'top': size.height * 0.25, 'right': -size.width * 0.03, 'size': 25.0},
      {'top': size.height * 0.34, 'right': size.width * 0.15, 'size': 25.0},
      {'top': size.height * 0.25, 'right': size.width * 0.45, 'size': 25.0},
      {'top': size.height * 0.37, 'right': size.width * 0.48, 'size': 25.0},
      {'top': size.height * 0.08, 'left': size.width * 0.15, 'size': 15.0},
      {'top': size.height * 0.15, 'left': size.width * 0.08, 'size': 15.0},
      {'top': size.height * 0.20, 'left': size.width * 0.2, 'size': 15.0},
      {'top': size.height * 0.3, 'left': size.width * 0.08, 'size': 15.0},
    ];

    for (var pos in positions) {
      circles.add(
        Positioned(
          top: (pos['top'] as double) + verticalOffset!,
          left: pos['left'],
          right: pos['right'],
          child: Container(
            width: pos['size'] as double,
            height: pos['size'] as double,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.18),
            ),
          ),
        ),
      );
    }

    return circles;
  }
}
