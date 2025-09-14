import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/Book%20Haven/onboarding/BkOnboardingPage3.dart';
import '../../Core Components/colors.dart';
import '../../Core Components/style.dart';
import '../../Core Components/text_style.dart';
import '../../Core Components/images.dart';

class BkOnboardingPage2 extends StatefulWidget {
  const BkOnboardingPage2({super.key});

  @override
  State<BkOnboardingPage2> createState() => _BkOnboardingPage2State();
}

class _BkOnboardingPage2State extends State<BkOnboardingPage2>
    with WidgetsBindingObserver {
  Timer? _navigationBarTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setupStatusBar();
  }

  @override
  void dispose() {
    _navigationBarTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _setupStatusBar();
    }
  }

  void _setupStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
    ));
    _startNavigationBarHideTimer();
  }

  void _startNavigationBarHideTimer() {
    _navigationBarTimer?.cancel();
    _navigationBarTimer = Timer(const Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top],
      );
    });
  }

  void _onContinuePressed() {
    // Navigate to Page2 (to be implemented later)
    debugPrint('Continue button pressed - ready for page 3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkBackgroundColor,
      body: Column(
        children: [
          // Top section with image - centered
          Expanded(
            flex: 6,
            child: Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SvgPicture.asset(
                  bkOnboarding1,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Middle section with rounded background container and text content
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: bhCardBg.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Step into the Literary Oasis!',
                    textAlign: TextAlign.center,
                    style: bkHeaderTextStlye,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Explore a universe of tales. Discover your beloved genres and writers effortlessly.',
                    textAlign: TextAlign.center,
                    style: bkDetailsTextStyle,
                  ),
                  const SizedBox(height: 52),

                  // Stadium-shaped Continue Button with 5px border
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _startNavigationBarHideTimer();
                        _onContinuePressed();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BkOnboardingPage3(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 100, // Slightly bigger for outer border
                        height: 60,
                        padding: const EdgeInsets.all(
                            1), // gap between inner & outer
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(
                            color: bhPrimary1
                                .withOpacity(0.3), // outer border color
                            width: 2,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: bhPrimary1,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(bkArrowForwordIcon),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Updated page indicator - longer active indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 6,
                        decoration: BoxDecoration(
                          color: bkInactiveIndicator, // Inactive dot
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 20,
                        height: 6,
                        decoration: BoxDecoration(
                          color: bhPrimary1, // Active indicator - longer
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 8,
                        height: 6,
                        decoration: BoxDecoration(
                          color: bkInactiveIndicator, // Inactive dot
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
