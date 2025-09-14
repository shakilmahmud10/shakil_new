import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Core Components/colors.dart';
import '../Core Components/style.dart';
import '../Core Components/text_style.dart';
import '../Core Components/images.dart';
import 'models/qm_onboarding_data.dart';

class QmOnboardingFlowScreen extends StatefulWidget {
  const QmOnboardingFlowScreen({super.key});

  @override
  State<QmOnboardingFlowScreen> createState() => _QmOnboardingFlowScreenState();
}

class _QmOnboardingFlowScreenState extends State<QmOnboardingFlowScreen>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  Timer? _navigationBarTimer;
  String selectedLanguage = 'English (US)';

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
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _setupStatusBar();
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    // Restart timer when system UI visibility changes (e.g., user drags up navigation bar)
    _startNavigationBarHideTimer();
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
    _navigationBarTimer = Timer(const Duration(milliseconds: 1000), () {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top],
      );
    });
  }

  void _nextPage() {
    if (_currentPageIndex < QmOnboardingData.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page - return to main menu
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  void _skipToMainMenu() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBG1,
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemCount: QmOnboardingData.pages.length,
        itemBuilder: (context, index) {
          final pageData = QmOnboardingData.pages[index];

          if (pageData.isLanguageSelection) {
            return _buildLanguageSelectionPage(pageData);
          } else if (pageData.isProgressLoader) {
            return _buildProgressLoaderPage(pageData);
          } else {
            return _buildStandardPage(pageData);
          }
        },
      ),
    );
  }

  Widget _buildStandardPage(QmOnboardingPageData pageData) {
    return Column(
      children: [
        // Top section with image
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: pageData.svgIcon != null
                    ? SvgPicture.asset(
                        pageData.svgIcon!,
                        fit: BoxFit.contain,
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),

        // Middle section with text content
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageData.title,
                  textAlign: TextAlign.left,
                  style: qmHeaderTextStyle,
                ),
                const SizedBox(height: 16),
                Text(
                  pageData.description,
                  style: qmDetailsTextStyle,
                ),
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
                      _nextPage();
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
                      child: Text(
                        pageData.buttonText,
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
    );
  }

  Widget _buildLanguageSelectionPage(QmOnboardingPageData pageData) {
    return Column(
      children: [
        // Top section with title and description
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageData.title,
                  style: qmHeaderTextStyle,
                ),
                const SizedBox(height: 12),
                Text(
                  pageData.description,
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: pageData.languages!.map(_buildLanguageOption).toList(),
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
                        _skipToMainMenu();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: qmCardBg,
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
                        _nextPage();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: qmPrimary1,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          pageData.buttonText,
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
    );
  }

  Widget _buildProgressLoaderPage(QmOnboardingPageData pageData) {
    return Column(
      children: [
        // Top section with image
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: pageData.svgIcon != null
                    ? SvgPicture.asset(
                        pageData.svgIcon!,
                        fit: BoxFit.contain,
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),

        // Middle section with text content
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageData.title,
                  textAlign: TextAlign.left,
                  style: qmHeaderTextStyle,
                ),
                const SizedBox(height: 16),
                Text(
                  pageData.description,
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
          height: 8,
          decoration: BoxDecoration(
            color: qmDetailsText1.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: qmPrimary1,
                borderRadius: BorderRadius.circular(4),
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
