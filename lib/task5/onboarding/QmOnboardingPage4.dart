import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/colors.dart';
import '../../widgets/style.dart';
import '../../widgets/text_style.dart';
import 'QmOnboardingPage5.dart';

class QMOnboardingPage4 extends StatefulWidget {
  const QMOnboardingPage4({super.key});

  @override
  State<QMOnboardingPage4> createState() => _QMOnboardingPage4State();
}

class _QMOnboardingPage4State extends State<QMOnboardingPage4>
    with WidgetsBindingObserver {
  Timer? _navigationBarTimer;
  String selectedLanguage = 'English (US)';

  final List<String> languages = [
    'English (US)',
    'Bangla',
    'Arabic',
    'Hindi',
    'Urdu',
    'Persian',
    'Bahasa',
  ];

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
    // Navigate back to main menu
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _onConfirmPressed() {
    debugPrint('Confirm button pressed with language: $selectedLanguage');
    // Navigate to the next onboarding page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const QMOnboardingPage5(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBG1,
      body: Column(
        children: [
          // Top section with title and description
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.redAccent,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Language',
                    style: qmHeaderTextStyle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Translations, Tafsir and Word by Word language will be automatically selected based on your language selection.',
                    style: qmDetailsTextStyle.copyWith(
                      color: qmDetailsText1.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Middle section with language options
          Expanded(
            flex: 7,
            child: Container(
              // color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: languages.map(_buildLanguageOption).toList(),
              ),
            ),
          ),

          // Bottom section with buttons
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  // Skip button
                  Expanded(
                    flex: 1,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _startNavigationBarHideTimer();
                          _onSkipPressed();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: qmDisable,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Skip',
                            textAlign: TextAlign.center,
                            style: qmButtonTextStyle.copyWith(
                              color: qmDetailsText1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Confirm button
                  Expanded(
                    flex: 1,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _startNavigationBarHideTimer();
                          _onConfirmPressed();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: qmPrimary1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Confirm',
                            textAlign: TextAlign.center,
                            style: qmButtonTextStyle,
                          ),
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

  Widget _buildLanguageOption(String languageName) {
    final bool isSelected = selectedLanguage == languageName;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedLanguage = languageName;
          });
        },
        splashColor: qmPrimary1.withOpacity(0.1),
        highlightColor: qmPrimary1.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              // Radio button
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? qmPrimary1
                        : qmDetailsText1.withOpacity(0.3),
                    width: 2,
                  ),
                  color: Colors.transparent,
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: qmPrimary1,
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              // Language name
              Expanded(
                child: Text(
                  languageName,
                  style: qmDetailsTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? qmHeaderText1 : qmDetailsText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
