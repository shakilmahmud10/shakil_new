// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/colors.dart';
import '../widgets/images.dart';
import '../widgets/text_style.dart';

class Onboardingpage7 extends StatelessWidget {
  const Onboardingpage7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: TopPreviewWidget(
              primaryColor: onBoardingPrimary4,
              isMultiIcon: false,
            ),
          ),
          Expanded(
            flex: 5,
            child: OnboardingTextWidget(
              title: "ডাটাবেজ লোড করা হচ্ছে",
              description:
                  "দয়া করে কিছুক্ষন অপেক্ষা করুন, ডাটাবেস লোড হয়ে গেলে আপনাকে হাদিস কালেকশন এ নিয়ে যাওয়া হবে।",
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomNavigationWidget(
              currentPage: 0,
              totalPages: 2,
              onNextPressed: () {},
              // activeColor: onBoardingPrimary1,
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

  const TopPreviewWidget({
    super.key,
    required this.primaryColor,
    required this.isMultiIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          ..._buildBackgroundCircles(size),
          Center(child: _buildSingleIconContent()),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundCircles(Size size) {
    return [
      Positioned(
        top: -size.width * 0.42,
        right: -size.width * 0.25,
        child: Container(
          width: size.width * 1.5,
          height: size.width * 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 197, 255, 181).withOpacity(0.2),
                onBoardingPrimary4.withOpacity(0.2),
              ],
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      Positioned(
        top: -size.width * 0.4,
        left: -size.width * 0.2,
        child: Container(
          width: size.width * 1.4,
          height: size.width * 1.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color(0xFFF4FFF1).withOpacity(0.2),
                onBoardingPrimary4.withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
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
              color: primaryColor.withOpacity(0.18),
            ),
          ),
        ),
      );
    }

    return circles;
  }

  Widget _buildSingleIconContent() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SvgPicture.asset(onboardingImage5, height: 120, width: 120),
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
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center, style: kOnboardingTitleText),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: kOnboardingSubTitleText,
          ),
        ],
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;
  // final Color activeColor;

  const BottomNavigationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
    // required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomSliderLoader(progress: 1.0),
          const SizedBox(height: 16),
          const Text(
            'লোডিং সম্পন্ন হয়েছে',
            style: kOnboardingProgressCompletedText,
          ),
        ],
      ),
    );
  }
}

class CustomSliderLoader extends StatelessWidget {
  final double progress;
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const CustomSliderLoader({
    super.key,
    required this.progress,
    this.height = 12.0,
    this.backgroundColor = const Color(0xFFE6F4F1),
    this.progressColor = onBoardingPrimary1,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth, // Or you can set a fixed width
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(height / 2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
