import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/colors.dart';
import '../../widgets/style.dart';
import '../../widgets/text_style.dart';
import '../../widgets/images.dart';

class QMOnboardingPage5 extends StatefulWidget {
  const QMOnboardingPage5({super.key});

  @override
  State<QMOnboardingPage5> createState() => _QMOnboardingPage5State();
}

class _QMOnboardingPage5State extends State<QMOnboardingPage5>
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
    debugPrint('Continue button pressed');
    // Add navigation logic here
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
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    qmOnboarding5,
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
                    'Please Wait Sometime',
                    textAlign: TextAlign.left,
                    style: qmHeaderTextStyle,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We are optimizing this app based on your selected language, please wait sometime',
                    style: qmDetailsTextStyle,
                  ),
                ],
              ),
            ),
          ),

          // Bottom section with custom slider loader
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Custom Slider Loader
                  const CustomSliderLoader(
                    progress: 0.4, // 40% progress
                    progressText: 'Already Optimized 40%',
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

// Custom Slider Loader Widget
class CustomSliderLoader extends StatelessWidget {
  final double progress;
  final String progressText;

  const CustomSliderLoader({
    super.key,
    required this.progress,
    required this.progressText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Bar
        Container(
          width: double.infinity,
          height: 12,
          decoration: BoxDecoration(
            color: qmDetailsText1.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: qmPrimary1,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Progress Text
        Text(
          progressText,
          style: qmDetailsTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: qmDetailsText1,
          ),
        ),
      ],
    );
  }
}
