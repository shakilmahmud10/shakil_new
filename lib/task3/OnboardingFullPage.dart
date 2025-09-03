// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/colors.dart';
import '../widgets/images.dart';

class OnboardingFullPage extends StatefulWidget {
  const OnboardingFullPage({super.key});

  @override
  _OnboardingFullPageState createState() => _OnboardingFullPageState();
}

class _OnboardingFullPageState extends State<OnboardingFullPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<OnboardingData> pages = [
    OnboardingData(
      primaryColor: onBoardingPrimary1,
      backgroundColor: Color(0xFFE8F8F5),
      title: "সবচেয়ে বড় হাদিসের সম্ভার",
      description: "২৪+ হাদিসের বই এবং ৫০০০০+ হাদিসের কালেকশন আছে এই অ্যাপে",
      isMultiIcon: false,
    ),
    OnboardingData(
      primaryColor: Color(0xFFF39C12),
      backgroundColor: Color(0xFFFFF4E6),
      title: "আমাদের ফিচারসমূহ",
      description:
          "আমরা অনেকগুলো নতুন ফিচার যুক্ত করেছি। তারমধ্যে অন্যতম - বুকমার্ক, হিফজ, সরাসরি হাদিসে যাওয়া এবং লাস্ট রিড",
      isMultiIcon: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  data: pages[index],
                  currentPage: currentPage,
                  totalPages: pages.length,
                  onNextPressed: () {
                    if (currentPage < pages.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutSine,
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final Color primaryColor;
  final Color backgroundColor;
  final String title;
  final String description;
  final bool isMultiIcon;

  OnboardingData({
    required this.primaryColor,
    required this.backgroundColor,
    required this.title,
    required this.description,
    required this.isMultiIcon,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;

  const OnboardingPage({
    super.key,
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Preview Section
        Expanded(
          flex: 4,
          child: TopPreviewWidget(
            primaryColor: data.primaryColor,
            backgroundColor: data.backgroundColor,
            isMultiIcon: data.isMultiIcon,
          ),
        ),
        // Text Section
        Expanded(
          flex: 3,
          child: OnboardingTextWidget(
            title: data.title,
            description: data.description,
          ),
        ),
        // Bottom Navigation Section
        Expanded(
          flex: 1,
          child: BottomNavigationWidget(
            currentPage: currentPage,
            totalPages: totalPages,
            onNextPressed: onNextPressed,
            activeColor: data.primaryColor,
          ),
        ),
      ],
    );
  }
}

class TopPreviewWidget extends StatelessWidget {
  final Color primaryColor;
  final Color backgroundColor;
  final bool isMultiIcon;

  const TopPreviewWidget({
    super.key,
    required this.primaryColor,
    required this.backgroundColor,
    required this.isMultiIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          ..._buildBackgroundCircles(size),
          // Center Content
          Center(
            child: isMultiIcon
                ? _buildMultiIconContent()
                : _buildSingleIconContent(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundCircles(Size size) {
    return [
      // Large circle - opacity 0.1
      Positioned(
        top: -size.width * 0.42,
        right: -size.width * 0.25,
        child: Container(
          width: size.width * 1.5,
          height: size.width * 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.1),
          ),
        ),
      ),
      // Medium circle - opacity 0.3
      Positioned(
        top: -size.width * 0.4,
        left: -size.width * 0.2,
        child: Container(
          width: size.width * 1.4,
          height: size.width * 1.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.2),
          ),
        ),
      ),
      // Small circles with opacity 0.4
      ..._buildSmallCircles(size),
    ];
  }

  List<Widget> _buildSmallCircles(Size size) {
    List<Widget> circles = [];

    // Multiple small circles positioned randomly
    final positions = [
      {'top': size.height * 0.06, 'right': size.width * 0.03, 'size': 40.0},
      {'top': size.height * 0.15, 'right': size.width * 0.15, 'size': 40.0},
      {'top': size.height * 0.15, 'right': size.width * 0.56, 'size': 40.0},

      {'top': size.height * 0.22, 'right': size.width * 0.25, 'size': 25.0},
      {'top': size.height * 0.25, 'right': -size.width * 0.03, 'size': 25.0},
      {'top': size.height * 0.34, 'right': size.width * 0.15, 'size': 25.0},
      {'top': size.height * 0.25, 'right': size.width * 0.45, 'size': 25.0},
      {'top': size.height * 0.37, 'right': size.width * 0.48, 'size': 25.0},

      {'top': size.height * 0.08, 'left': size.width * 0.15, 'size': 15.0},
      {'top': size.height * 0.15, 'left': size.width * 0.08, 'size': 15.0},
      {'top': size.height * 0.20, 'left': size.width * 0.2, 'size': 15.0},
      {'top': size.height * 0.3, 'left': size.width * 0.08, 'size': 15.0},
    ];

    for (var pos in positions) {
      circles.add(
        Positioned(
          top: pos['top'] as double,
          left: pos['left'],
          right: pos['right'],
          child: Container(
            width: pos['size'] as double,
            height: pos['size'] as double,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.4),
            ),
          ),
        ),
      );
    }

    return circles;
  }

  Widget _buildSingleIconContent() {
    return Container(
      decoration: BoxDecoration(
        // color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SvgPicture.asset(onboardingImage1),
    );
  }

  Widget _buildMultiIconContent() {
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
          buildIconCard(onboardingIcon1),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildIconCard(onboardingIcon2),
              const SizedBox(width: 20),
              buildIconCard(onboardingIcon3),
            ],
          ),

          const SizedBox(height: 20),
          buildIconCard(onboardingIcon4),
        ],
      ),
    );
  }
}

class OnboardingTextWidget extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingTextWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontFamily: 'Ador Bangla',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              // fontFamily: 'Ador Bangla',
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;
  final Color activeColor;

  const BottomNavigationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PageIndicatorWidget(
            currentIndex: currentPage,
            totalCount: totalPages,
          ),
          CustomButton(text: "পরবর্তী", onPressed: onNextPressed),
        ],
      ),
    );
  }
}

class PageIndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final int totalCount;

  const PageIndicatorWidget({
    super.key,
    required this.currentIndex,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalCount, (index) {
        return Container(
          margin: EdgeInsets.only(right: 8),
          width: index == currentIndex ? 12 : 8,
          height: index == currentIndex ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex
                ? onBoardingPrimary1
                : Colors.grey.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  // final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    // required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: onBoardingPrimary1,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              // fontFamily: 'Ador Bangla',
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward, size: 18),
        ],
      ),
    );
  }
}
