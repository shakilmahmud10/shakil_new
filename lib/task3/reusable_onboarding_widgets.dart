import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/images.dart';

class ReusableOnboardingWidget extends StatelessWidget {
  // Required parameters
  final String headerText;
  final String detailsText;
  final VoidCallback buttonNavigator;
  final dynamic
  mainIcon; // bool for single/multiple, or IconData for single icon

  // Optional parameters
  final Color? primaryColor;

  const ReusableOnboardingWidget({
    super.key,
    required this.headerText,
    required this.detailsText,
    required this.buttonNavigator,
    required this.mainIcon,
    this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = primaryColor ?? const Color(0xFF2ECC71);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Preview Section
          Expanded(
            flex: 4,
            child: TopPreviewWidget(
              primaryColor: effectiveColor,
              isMultiIcon: mainIcon is bool ? mainIcon as bool : false,
              singleIcon: mainIcon is IconData
                  ? mainIcon as IconData
                  : Icons.book,
            ),
          ),
          // Text Section
          Expanded(
            flex: 3,
            child: OnboardingTextWidget(
              title: headerText,
              description: detailsText,
            ),
          ),
          // Bottom Navigation Section
          Expanded(
            flex: 1,
            child: BottomNavigationWidget(
              onNextPressed: buttonNavigator,
              activeColor: effectiveColor,
            ),
          ),
        ],
      ),
    );
  }
}

class TopPreviewWidget extends StatelessWidget {
  final Color primaryColor;
  final bool isMultiIcon;
  final IconData singleIcon;

  const TopPreviewWidget({
    super.key,
    required this.primaryColor,
    required this.isMultiIcon,
    required this.singleIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          ..._buildBackgroundCircles(size),
          // Center Content
          Center(
            child: isMultiIcon
                ? _buildMultiIconContent()
                : _buildSingleIconContent(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundCircles(Size size) {
    return [
      // Large circle - opacity 0.1
      Positioned(
        top: -size.width * 0.42,
        right: -size.width * 0.25,
        child: Container(
          width: size.width * 1.5,
          height: size.width * 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.1),
          ),
        ),
      ),
      // Medium circle - opacity 0.2
      Positioned(
        top: -size.width * 0.4,
        left: -size.width * 0.2,
        child: Container(
          width: size.width * 1.4,
          height: size.width * 1.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.2),
          ),
        ),
      ),
      // Small circles with opacity 0.4
      ..._buildSmallCircles(size),
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
          top: pos['top'] as double,
          left: pos['left'],
          right: pos['right'],
          child: Container(
            width: pos['size'] as double,
            height: pos['size'] as double,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.4),
            ),
          ),
        ),
      );
    }

    return circles;
  }

  Widget _buildSingleIconContent() {
    return Container(child: SvgPicture.asset(onboardingImage1));
  }

  Widget _buildMultiIconContent() {
    Widget buildIconCard(IconData icon) {
      return Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(child: Icon(icon, size: 40, color: primaryColor)),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIconCard(Icons.bookmark),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildIconCard(Icons.favorite),
              const SizedBox(width: 20),
              buildIconCard(Icons.search),
            ],
          ),
          const SizedBox(height: 20),
          buildIconCard(Icons.history),
        ],
      ),
    );
  }
}

class OnboardingTextWidget extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingTextWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  final VoidCallback onNextPressed;
  final Color activeColor;

  const BottomNavigationWidget({
    super.key,
    required this.onNextPressed,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: "পরবর্তী",
            onPressed: onNextPressed,
            backgroundColor: activeColor,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, size: 18),
        ],
      ),
    );
  }
}
