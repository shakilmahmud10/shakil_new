import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/colors.dart';
import '../widgets/text_style.dart';
import '../widgets/images.dart';
import 'models/onboarding_data.dart';
import 'widgets/background_circles_widget.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  bool _showWarningSection = false;
  bool _showIntermediateWarning = false; // New state for intermediate warning
  double _loadingProgress = 0.0;
  bool _loadingComplete = false;
  Timer? _navigationBarTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _hideStatusBar();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _navigationBarTimer?.cancel();
    _showStatusBar();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Restore transparent status bar when app regains focus
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _hideStatusBar();
        }
      });
    }
  }

  // void _startNavigationBarHideTimer() {
  //   // Cancel any existing timer
  //   _navigationBarTimer?.cancel();

  //   // Start a new timer to hide navigation bar after 2 seconds
  //   _navigationBarTimer = Timer(const Duration(seconds: 2), () {
  //     if (mounted) {
  //       _hideStatusBar();
  //     }
  //   });
  // }

  String _convertToBanglaNumber(int number) {
    const Map<String, String> banglaDigits = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };

    String numberStr = number.toString();
    String banglaNumber = '';

    for (int i = 0; i < numberStr.length; i++) {
      banglaNumber += banglaDigits[numberStr[i]] ?? numberStr[i];
    }

    return banglaNumber;
  }

  void _hideStatusBar() {
    // Show status bar elements but hide background (transparent effect)
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
    // Make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void _startNavigationBarHideTimer() {
    // Cancel any existing timer
    _navigationBarTimer?.cancel();

    // Start a new timer to hide navigation bar after 2 seconds
    _navigationBarTimer = Timer(const Duration(seconds: 1), () {
      if (mounted) {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [SystemUiOverlay.top],
        );
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
      }
    });
  }

  void _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  List<TextSpan> _buildDescriptionTextSpans(String text) {
    const String boldText = "সম্মতি দিচ্ছি";

    if (text.contains(boldText)) {
      List<TextSpan> spans = [];
      List<String> parts = text.split('"$boldText"');

      for (int i = 0; i < parts.length; i++) {
        spans.add(TextSpan(text: parts[i]));

        if (i < parts.length - 1) {
          spans.add(TextSpan(text: '"'));
          spans.add(
            TextSpan(
              text: boldText,
              style: kOnboardingSubTitleText.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
          spans.add(TextSpan(text: '"'));
        }
      }

      return spans;
    } else {
      return [TextSpan(text: text)];
    }
  }

  void _nextPage() {
    if (_currentPageIndex < OnboardingData.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // On the last page (4th page)
      if (!_showIntermediateWarning) {
        // First click - show intermediate warning
        setState(() {
          _showIntermediateWarning = true;
        });
      } else {
        // Second click - navigate to next page and show loading
        setState(() {
          _showIntermediateWarning = false;
        });
        // Navigate to the warning section (next page)
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _startLoadingAnimation() {
    // Simulate loading progress with more precision
    const int totalSteps = 10;
    const Duration stepDuration = Duration(milliseconds: 100);

    Future.delayed(stepDuration, () {
      if (mounted && _loadingProgress < 1.0) {
        setState(() {
          _loadingProgress += 1.0 / totalSteps; // Increment by exactly 10%
          // Ensure progress never exceeds 1.0
          if (_loadingProgress >= 1.0) {
            _loadingProgress = 1.0;
          }
        });

        if (_loadingProgress < 1.0) {
          _startLoadingAnimation();
        } else {
          // Loading reached 100%, wait 1 second then show completion message
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _loadingComplete = true;
              });
            }
          });
        }
      }
    });
  }

  // void _onWarningButtonPressed() {
  //   // Add your conditional logic here for the warning section button
  //   // For example, you could check user permissions, network status, etc.

  //   // Navigate to the next screen (Onboardingpage7 as per original flow)
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Onboardingpage7()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // Detect swipe from bottom edge (when delta.dy is negative, user is swiping up)
        if (details.globalPosition.dy >
                MediaQuery.of(context).size.height * 0.85 &&
            details.delta.dy < -5) {
          // User is swiping up from bottom area - start hide timer
          _startNavigationBarHideTimer();
        }
      },
      onTap: () {
        // Also start timer on any tap to handle other interactions
        _startNavigationBarHideTimer();
      },
      child: Scaffold(
        body: Column(
          children: [
            // Top & Middle sections with PageView for swipe detection
            Expanded(
              flex: 13, // Combined flex (8+5) for responsive swipe area
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  if (index >= OnboardingData.pages.length) {
                    // User swiped to the warning section
                    _showWarningSection = true;
                    _showIntermediateWarning =
                        false; // Reset intermediate warning
                    _loadingProgress = 0.0; // Reset progress
                    _loadingComplete = false; // Reset completion state
                    _startLoadingAnimation();
                    setState(() {});
                  } else {
                    setState(() {
                      _currentPageIndex = index;
                      _showWarningSection = false;
                      _showIntermediateWarning =
                          false; // Reset intermediate warning when navigating
                    });
                  }
                },
                itemCount: OnboardingData.pages.length + 1,
                itemBuilder: (context, index) {
                  if (index >= OnboardingData.pages.length) {
                    // This is the warning section - return top and middle only
                    return _buildWarningTopMiddleSections();
                  }
                  return _buildTopMiddleSections(index);
                },
              ),
            ),
            // Bottom section separate - no swipe, only button interaction
            Expanded(
              flex: 2,
              child: _showWarningSection
                  ? _buildWarningBottomSection()
                  : _buildBottomNavigation(
                      OnboardingData.pages[_currentPageIndex],
                      _currentPageIndex,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopMiddleSections(int index) {
    final pageData = OnboardingData.pages[index];
    // When page index is 2, give middle section extra space from top section
    final topFlex = index == 2 ? 6 : 8;
    final middleFlex = index == 2 ? 7 : 5;

    return Column(
      children: [
        Expanded(flex: topFlex, child: _buildTopPreviewWidget(pageData, index)),
        Expanded(flex: middleFlex, child: _buildTextSection(pageData)),
      ],
    );
  }

  Widget _buildWarningTopMiddleSections() {
    final warningData = OnboardingData.warningPageData;
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                WarningBackgroundCirclesWidget(
                  primaryColor: warningData.primaryColor,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      warningData.svgIcon!,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  warningData.title,
                  textAlign: TextAlign.center,
                  style: kOnboardingTitleText,
                ),
                const SizedBox(height: 16),
                Text(
                  warningData.description,
                  textAlign: TextAlign.center,
                  style: kOnboardingSubTitleText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWarningBottomSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildCustomSliderLoader(progress: _loadingProgress),
          const SizedBox(height: 16),
          Text(
            _loadingComplete
                ? 'লোডিং সম্পন্ন হয়েছে' // "Loading complete"
                : '${_convertToBanglaNumber((_loadingProgress * 100).round())}% লোড হয়েছে',
            style: _loadingComplete
                ? kOnboardingProgressCompletedText
                : kOnboardingProgressRunningText,
          ),
        ],
      ),
    );
  }

  Widget _buildTopPreviewWidget(OnboardingPageData pageData, int index) {
    // Move circles up by 20% when page index is 2 to prevent cutting at bottom
    final verticalOffset = index == 2
        ? -MediaQuery.of(context).size.height * 0.14
        : 0.0;

    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          BackgroundCirclesWidget(
            primaryColor: pageData.primaryColor,
            verticalOffset: verticalOffset,
          ),
          Center(
            child: pageData.isMultiIcon
                ? _buildMultiIconContent(pageData.multipleIcons!)
                : _buildSingleIconContent(pageData.svgIcon!),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleIconContent(String svgIcon) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SvgPicture.asset(svgIcon),
    );
  }

  Widget _buildMultiIconContent(List<String> icons) {
    Widget buildIconCard(String svgIcon) {
      return Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFFDFAF0).withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: SvgPicture.asset(
            svgIcon,
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIconCard(icons[0]),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildIconCard(icons[1]),
              const SizedBox(width: 20),
              buildIconCard(icons[2]),
            ],
          ),
          const SizedBox(height: 20),
          buildIconCard(icons[3]),
        ],
      ),
    );
  }

  Widget _buildTextSection(OnboardingPageData pageData) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pageData.title,
            textAlign: TextAlign.center,
            style: kOnboardingTitleText,
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: kOnboardingSubTitleText,
              children: _buildDescriptionTextSpans(pageData.description),
            ),
          ),
          if (pageData.description2 != null) ...[
            const SizedBox(height: 16),
            Text(
              pageData.description2!,
              textAlign: TextAlign.center,
              style: kOnboardingSubTitleText,
            ),
          ],
          // Show warning container for 4th page when intermediate warning is active
          if (_currentPageIndex == OnboardingData.pages.length - 1 &&
              _showIntermediateWarning) ...[
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 14.0,
              ),
              decoration: BoxDecoration(
                color: onBoardingWerningColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(onboardingWerning),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      'অ্যাপটি ব্যবহারের জন্য অবশ্যই সম্মতি দিতে হবে। দয়া করে "YES" বাটন এ ক্লিক করুন',
                      style: kOnboardingWerningText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(OnboardingPageData pageData, int index) {
    // Special case for the last page (Notification page)
    if (index == OnboardingData.pages.length - 1) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCustomButton(text: pageData.buttonText, onPressed: _nextPage),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPageIndicator(index),
          _buildCustomButton(text: pageData.buttonText, onPressed: _nextPage),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int currentIndex) {
    return Row(
      children: List.generate(
        OnboardingData.pages.length,
        (index) => Container(
          margin: const EdgeInsets.only(right: 8),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex
                ? onBoardingPrimary1
                : Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: () {
        // Start navigation bar hide timer when button is pressed
        _startNavigationBarHideTimer();
        onPressed();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
        decoration: BoxDecoration(
          color: onBoardingPrimary1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: kOnboardingButtonText),
            if (text == "পরবর্তী") ...[
              const SizedBox(width: 10),
              SvgPicture.asset(onboardingArrow),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCustomSliderLoader({required double progress}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: 12.0,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F4F1),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  color: onBoardingPrimary1,
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
