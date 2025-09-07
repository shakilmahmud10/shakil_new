import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/colors.dart';
import '../widgets/text_style.dart';
import '../widgets/images.dart';
import 'models/onboarding_data.dart';
import 'widgets/background_circles_widget.dart';
import 'Onboardingpage7.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  bool _showWarningSection = false;
  double _loadingProgress = 0.0;
  bool _loadingComplete = false;

  @override
  void initState() {
    super.initState();
    _hideStatusBar();
  }

  @override
  void dispose() {
    _showStatusBar();
    _pageController.dispose();
    super.dispose();
  }

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  void _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  void _nextPage() {
    if (_currentPageIndex < OnboardingData.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _showWarningSection = true;
      _loadingProgress = 0.0; // Reset progress
      _loadingComplete = false; // Reset completion state
      _startLoadingAnimation();
      setState(() {});
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

  void _onWarningButtonPressed() {
    // Add your conditional logic here for the warning section button
    // For example, you could check user permissions, network status, etc.

    // Navigate to the next screen (Onboardingpage7 as per original flow)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Onboardingpage7()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  _loadingProgress = 0.0; // Reset progress
                  _loadingComplete = false; // Reset completion state
                  _startLoadingAnimation();
                  setState(() {});
                } else {
                  setState(() {
                    _currentPageIndex = index;
                    _showWarningSection = false;
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
    );
  }

  Widget _buildTopMiddleSections(int index) {
    final pageData = OnboardingData.pages[index];
    return Column(
      children: [
        Expanded(flex: 8, child: _buildTopPreviewWidget(pageData)),
        Expanded(flex: 5, child: _buildTextSection(pageData)),
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
          GestureDetector(
            onTap: _onWarningButtonPressed,
            child: Text(
              _loadingComplete
                  ? 'লোডিং সম্পন্ন হয়েছে' // "Loading complete"
                  : '${_convertToBanglaNumber((_loadingProgress * 100).round())}% লোড হয়েছে',
              style: _loadingComplete
                  ? kOnboardingProgressCompletedText
                  : kOnboardingProgressRunningText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopPreviewWidget(OnboardingPageData pageData) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          BackgroundCirclesWidget(primaryColor: pageData.primaryColor),
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
          Text(
            pageData.description,
            textAlign: TextAlign.center,
            style: kOnboardingSubTitleText,
          ),
          if (pageData.description2 != null) ...[
            const SizedBox(height: 16),
            Text(
              pageData.description2!,
              textAlign: TextAlign.center,
              style: kOnboardingSubTitleText,
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
            _buildCustomButton(
              text: pageData.buttonText,
              onPressed: _nextPage,
              backgroundColor: onBoardingPrimary1,
            ),
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
          _buildCustomButton(
            text: pageData.buttonText,
            onPressed: _nextPage,
            backgroundColor: pageData.primaryColor,
          ),
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
    required Color backgroundColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: onBoardingPrimary1,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          if (text == "পরবর্তী") ...[
            const SizedBox(width: 10),
            SvgPicture.asset(onboardingArrow),
          ],
        ],
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
