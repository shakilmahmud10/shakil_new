import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/task6/onboarding/BkOnboardingPage6.dart';
import '../../widgets/colors.dart';
import '../../widgets/style.dart';
import '../../widgets/text_style.dart';
import '../../widgets/images.dart';

class BkOnboardingPage5 extends StatefulWidget {
  const BkOnboardingPage5({super.key});

  @override
  State<BkOnboardingPage5> createState() => _BkOnboardingPage5State();
}

class _BkOnboardingPage5State extends State<BkOnboardingPage5>
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

  void _onBackPressed() {
    debugPrint('Back button pressed');
    Navigator.pop(context);
  }

  void _onSkipPressed() {
    debugPrint('Skip button pressed');
    // Navigate to main app or complete onboarding
  }

  void _onContinueWithEmailPressed() {
    _startNavigationBarHideTimer();
    debugPrint('Continue with Email button pressed');
    // Navigate to email sign in screen
  }

  void _onSyncWithGooglePressed() {
    _startNavigationBarHideTimer();
    debugPrint('Sync with Google button pressed');
    // Navigate to Google sign in
  }

  void _onCreateNowPressed() {
    debugPrint('Create Now pressed');
    // Navigate to account creation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkBackgroundColor,
      body: Column(
        children: [
          // Top section with back button, skip button and image
          Expanded(
            flex: 6,
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

                // Back button positioned at top left
                Positioned(
                  top: 50,
                  left: 24,
                  child: InkWell(
                    onTap: _onBackPressed,
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        bkArrowBackIcon,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF64676A),
                          BlendMode.srcIn,
                        ),
                      ),
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
            flex: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                  color: bhPrimary1.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Log in your account',
                      textAlign: TextAlign.center,
                      style: bkHeaderTextStlye,
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: bkDetailsTextStyle,
                        children: [
                          const TextSpan(
                            text:
                                'If you need to save data, Then you can log in with ',
                          ),
                          TextSpan(
                            text: 'Ird Account',
                            style: bkDetailsTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: ' or ',
                          ),
                          TextSpan(
                            text: 'Google Sync',
                            style: bkDetailsTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '.',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 45),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BkOnboardingPage6(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: bhPrimary1,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: SvgPicture.asset(
                                  bkMessage1,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Continue with Email',
                                style: bkButtonTextStyle.copyWith(
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Sync with Google Button (Secondary)
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _onSyncWithGooglePressed,
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: bhButtonMutedBg,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: SvgPicture.asset(
                                  bkGoogleIcon,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Sync With Google',
                                style: bkButtonTextStyle.copyWith(
                                    color: bhTextPureDark),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom section with Create Now text
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: _onCreateNowPressed,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't Have An Account? ",
                          style: bkDetailsTextStyle.copyWith(
                            fontSize: 14,
                            color: bkDetailsTextColor,
                          ),
                        ),
                        TextSpan(
                          text: "Create Now",
                          style: bkDetailsTextStyle.copyWith(
                            fontSize: 14,
                            color: const Color(0xFF131313),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
