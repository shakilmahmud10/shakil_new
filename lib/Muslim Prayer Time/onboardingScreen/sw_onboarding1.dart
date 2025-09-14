// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/Muslim%20Prayer%20Time/onboardingScreen/sw_onboarding2.dart';

import '../../Core Components/colors.dart';
import '../../Core Components/images.dart';
import '../../Core Components/style.dart';

// --- Constants ---

// class _AppColors {
//   static const Color background = Color(0xFF0A0E1A);
//   // static const Color gradientStart = Color(0xFF1A233D);
//   static const Color primaryBlue = Color(0xFF4A80F0);
//   static const Color textColor = Colors.white;
//   static const Color headerTextColor = Color(0xFFC1DBFA);
//   static const Color indicatorActive = Color(0xFFC1DBFA);
//   static const Color indicatorNotActive = Color(0xFF7B90A8);
//   static const Color subtitleColor = Color(0xFF516378);
//   static const Color inactiveIndicator = Color(0xFF444B5E);
// }

// --- Onboarding Screen ---

class SWonboarding1 extends StatelessWidget {
  const SWonboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xFF01041F), gradient: swsplashBGGradient1),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Spacer(flex: 6),
                SwContentDisplay1(),
                Spacer(flex: 9),
                SwPageIndicator1(),
                Spacer(flex: 3),
                // SizedBox(height: _AppSpacers.verticalSpaceM),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Reusable Widgets ---

class SwContentDisplay1 extends StatelessWidget {
  const SwContentDisplay1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Location',
          style: swheadline,
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Enable location permission',
          style: swsubtitle,
        ),
        const SizedBox(height: 60.0),
        SvgPicture.asset(swOnboarding1),
        const SizedBox(height: 50),
        const Text(
          'Enable location permissions to find your local prayer times & calculate qibla directions.',
          textAlign: TextAlign.center,
          style: swbody,
        ),
        const SizedBox(height: 40),
        const SwGradientButton1(),
      ],
    );
  }
}

// --- The Gradient Button Widget ---

class SwGradientButton1 extends StatelessWidget {
  const SwGradientButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6FACF2), // Start color
            Color(0xFF3288ED), // End color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SWonboarding2(),
            ),
          );
        },
        style: ButtonStyle(
          // Make the button's background transparent to show the container's gradient
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          // Remove shadow
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 18),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          // The elevation can be set to 0 as the shadow is transparent
          elevation: WidgetStateProperty.all(0),
        ),
        child: Text(
          'Enable location permission',
          style: swbutton,
        ),
      ),
    );
  }
}

class SwPageIndicator1 extends StatelessWidget {
  const SwPageIndicator1();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SwIndicator1(isActive: true),
        SizedBox(width: 8),
        SwIndicator1(isActive: false),
        SizedBox(width: 8),
        SwIndicator1(isActive: false),
      ],
    );
  }
}

class SwIndicator1 extends StatelessWidget {
  final bool isActive;

  const SwIndicator1({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.0,
      width: isActive ? 80.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? swHeaderTextColor : indicatorNotActive,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
