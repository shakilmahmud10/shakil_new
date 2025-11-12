import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/Book%20Haven/onboarding/BkOnboardingPage5.dart';
import '../../Core Components/colors.dart';
import '../../Core Components/style.dart';
import '../../Core Components/text_style.dart';
import '../../Core Components/images.dart';

class BkOnboardingPage4 extends StatefulWidget {
  const BkOnboardingPage4({super.key});

  @override
  State<BkOnboardingPage4> createState() => _BkOnboardingPage4State();
}

class _BkOnboardingPage4State extends State<BkOnboardingPage4>
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

  void _onSkipPressed() {
    debugPrint('Skip button pressed');
    // Navigate to main app or complete onboarding
  }

  void _onSignInPressed() {
    _startNavigationBarHideTimer();
    debugPrint('Sign In button pressed');
    // Navigate to sign in screen
  }

  void _onCreateAccountPressed() {
    _startNavigationBarHideTimer();
    debugPrint('Create Account button pressed');
    // Navigate to create account screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkBackgroundColor,
      body: Column(
        children: [
          // Top section with skip button and image
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                // Image positioned at the end (bottom) of the flex
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SvgPicture.asset(
                      bkOnboarding1,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Skip button positioned at top right
                Positioned(
                  top: 50,
                  right: 24,
                  child: InkWell(
                    onTap: _onSkipPressed,
                    borderRadius: BorderRadius.circular(4),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64676A),
                          decoration: TextDecoration.underline,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Middle section with rounded background container and text content
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: bhPrimary1.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Login/Create your account',
                    textAlign: TextAlign.center,
                    style: bkHeaderTextStlye,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'To save your data, simply log in or create an account using your email or Google.',
                    textAlign: TextAlign.center,
                    style: bkDetailsTextStyle,
                  ),
                  const SizedBox(height: 44),
                  // Sign In Button (Primary)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BkOnboardingPage5(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: bhPrimary1,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style:
                                bkButtonTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Create Account Button (Secondary)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onCreateAccountPressed,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: bhButtonMutedBg, // Light green background
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text('Create Account',
                              style: bkButtonTextStyle.copyWith(
                                  color: Colors.black)),
                        ),
                      ),
                    ),
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
