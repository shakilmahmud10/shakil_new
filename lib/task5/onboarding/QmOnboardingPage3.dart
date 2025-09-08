import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/colors.dart';
import '../../widgets/style.dart';
import '../../widgets/text_style.dart';
import '../../widgets/images.dart';

// ignore: camel_case_types
class QMOnboardingPage3 extends StatefulWidget {
  const QMOnboardingPage3({super.key});

  @override
  State<QMOnboardingPage3> createState() => _QMOnboardingPage3State();
}

class _QMOnboardingPage3State extends State<QMOnboardingPage3>
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
    // Add navigation logic here
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.amber,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    qmOnboarding3,
                    height: 350,
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
                    'Enable Local Storage For Easy Bookmark Recovery',
                    textAlign: TextAlign.left,
                    style: qmHeaderTextStyle,
                  ),
                  SizedBox(height: 16),
                  Text(
                      'Allowing this permission helps us save your bookmarks locally. If you uninstall the app by mistake, your saved data will be restored when you reinstall.',
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
