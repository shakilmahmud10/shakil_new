import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/colors.dart';
import '../widgets/images.dart';
import '../widgets/text_style.dart';
import 'OnboardingPage3.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: TopPreviewWidget(
              primaryColor: onBoardingPrimary2,
              isMultiIcon: true,
            ),
          ),
          Expanded(
            flex: 5,
            child: OnboardingTextWidget(
              title: "আমাদের ফিচারসমূহ",
              description:
                  "আমরা অনেকগুলো নতুন ফিচার যুক্ত করেছি। তারমধ্যে অন্যতম - বুকমার্ক, হিফজ, সরাসরি হাদিসে যাওয়া এবং লাস্ট রিড",
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomNavigationWidget(
              currentPage: 1,
              totalPages: 2,
              onNextPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboardingpage3()),
                );
              },
              activeColor: Color(0xFFF39C12),
            ),
          ),
        ],
      ),
    );
  }
}

class TopPreviewWidget extends StatelessWidget {
  final Color primaryColor;
  final bool isMultiIcon;

  const TopPreviewWidget({
    super.key,
    required this.primaryColor,
    required this.isMultiIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          ..._buildBackgroundCircles(size),
          Center(child: _buildMultiIconContent()),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundCircles(Size size) {
    return [
      Positioned(
        top: -size.width * 0.42,
        right: -size.width * 0.25,
        child: Container(
          width: size.width * 1.48,
          height: size.width * 1.48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor.withOpacity(0.1),
          ),
        ),
      ),
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
      ..._buildSmallCircles(size),
    ];
  }

  List<Widget> _buildSmallCircles(Size size) {
    List<Widget> circles = [];
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
            style: kOnboardingTitleText,
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: kOnboardingSubTitleText,
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
          _PageIndicatorWidget(activeColor: activeColor),
          CustomButton(text: "পরবর্তী", onPressed: onNextPressed),
        ],
      ),
    );
  }
}

class _PageIndicatorWidget extends StatelessWidget {
  final Color activeColor;

  const _PageIndicatorWidget({required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 12),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 8),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: onBoardingPrimary1,
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: onBoardingPrimary1,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 10),
          SvgPicture.asset(onboardingArrow),
        ],
      ),
    );
  }
}
