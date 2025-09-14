import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/colors.dart';
import '../../widgets/style.dart';
import '../../widgets/text_style.dart';
import '../../widgets/images.dart';
import 'QmOnboardingPage2.dart';

// ignore: camel_case_types
class QmOnboardingPage1 extends StatefulWidget {
  const QmOnboardingPage1({super.key});

  @override
  State<QmOnboardingPage1> createState() => _QmOnboardingPage1State();
}

class _QmOnboardingPage1State extends State<QmOnboardingPage1>
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
    // Navigate to Page2
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const QMOnboardingPage2()),
    );
    debugPrint('Continue button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBG1,
      body: Column(
        children: [
          // Top section with image
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // color: Colors.amber,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    qmOnboarding1,
                    // height: 350,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          // Middle section with text content
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Feature in This App',
                    textAlign: TextAlign.left,
                    style: qmHeaderTextStyle,
                  ),
                  SizedBox(height: 16),
                  Text(
                      'We have added many new features like Bookmark, Hifz, Word by Word, Quranic Audio, Go Directly to Ayah and Last Read etc.',
                      // textAlign: TextAlign.center,
                      style: qmDetailsTextStyle),
                ],
              ),
            ),
          ),

          // Bottom section with button
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _startNavigationBarHideTimer();
                        _onContinuePressed();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: qmPrimary1,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: qmButtonTextStyle,
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
