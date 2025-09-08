import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_svg/svg.dart';
import 'package:shakil_new/task5/onboarding/QmOnboardingPage3.dart';
import 'package:shakil_new/task5/onboarding/QmOnboardingPage4.dart';
import 'package:shakil_new/task5/onboarding/QmOnboardingPage5.dart';
import 'package:shakil_new/widgets/images.dart';

import '../../widgets/colors.dart';
import '../onboarding/QmOnboardingPage1.dart';
import '../onboarding/QmOnboardingPage2.dart';

void main() {
  runApp(const MyApp());
}

/// Main App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Demo',
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}

/// Constants
class AppColors {
  static const Color backgroundStart = Color(0xFFB87447);
  static const Color backgroundEnd = Color(0xFFA06237);
  static const Color iconColor = Color(0xFFF5D7B3);
  static const Color textColor = Color(0x22FFFFFF);
}

class AppIcons {
  static const IconData book = Icons.menu_book; // Replace with your own later
}

/// Splash Screen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bookController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  late AnimationController _textController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Book animation
    _bookController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
        CurvedAnimation(parent: _bookController, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: _bookController, curve: Curves.easeInOut));

    // Text opacity animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: _textController, curve: Curves.easeInOut));

    // Start animations with completion handler
    _startAnimations();
  }

  void _startAnimations() async {
    try {
      // Start both animations and wait for completion
      await Future.wait([
        _bookController.forward(),
        _textController.forward(),
      ]);

      // Navigate to onboarding flow after animations complete
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const QMOnboardingPage5(),
          ),
        );
      }
    } catch (e) {
      debugPrint('Animation error: $e');
    }
  }

  @override
  void dispose() {
    _bookController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: splashBGGradient1),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Calligraphy Placeholder (text with opacity animation)
              FadeTransition(
                opacity: _opacityAnimation,
                child: SvgPicture.asset(
                  qmSplashCaliography,
                  errorBuilder: (context, error, stackTrace) {
                    debugPrint('Error loading calligraphy SVG: $error');
                    return const Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: AppColors.iconColor,
                    );
                  },
                ),
              ),

              /// Book Icon (rotate + scale)
              AnimatedBuilder(
                animation: _bookController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: SvgPicture.asset(
                        qmSplashIcon1,
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint('Error loading book icon SVG: $error');
                          return const Icon(
                            Icons.menu_book,
                            size: 80,
                            color: AppColors.iconColor,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
