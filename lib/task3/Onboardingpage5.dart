// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/colors.dart';
import '../widgets/images.dart';
// import 'OnboardingPage2.dart';

class Onboardingpage5 extends StatelessWidget {
  const Onboardingpage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: TopPreviewWidget(
              primaryColor: onBoardingPrimary2,
              isMultiIcon: false,
            ),
          ),
          Expanded(
            flex: 3,
            child: OnboardingTextWidget(
              title: "নোটিফিকেশন",
              description:
                  "আল-হাদিস অ্যাপ সম্পর্কিত বিভিন্ন গুরুত্বপুর্ণ নোটিফিকেশন পেতে নিচে \“সম্মতি দিচ্ছি\”বাটনে ক্লিক করুন",
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomNavigationWidget(
              currentPage: 0,
              totalPages: 2,
              onNextPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const OnboardingPageTwo(),
                //   ),
                // );
              },
              // activeColor: onBoardingPrimary1,
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
          Center(child: _buildSingleIconContent()),
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
          width: size.width * 1.5,
          height: size.width * 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFECA7).withOpacity(0.2),
                Color(0xFFF39C12).withOpacity(0.2),
              ],
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
            ),
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
            gradient: LinearGradient(
              colors: [
                Color(0xFFFBF9E9).withOpacity(0.2),
                Color(0xFFF39C12).withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
              color: primaryColor.withOpacity(0.18),
            ),
          ),
        ),
      );
    }

    return circles;
  }

  Widget _buildSingleIconContent() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SvgPicture.asset(onboardingImage4, height: 120, width: 120),
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
            style: TextStyle(fontSize: 18, color: Colors.black54, height: 1.5),
          ),
          SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFBEAE4),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xFFE55347),
                  size: 30.0,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    'অ্যাপটি ব্যবহারের জন্য অবশ্যই সম্মতি দিতে হবে। দয়া করে “YES” বাটন এ ক্লিক করুন',
                    style: TextStyle(color: Color(0xFF5C5C5C), fontSize: 16),
                  ),
                ),
              ],
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
  // final Color activeColor;

  const BottomNavigationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
    // required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: "সম্মতি দিচ্ছি",
            onPressed: onNextPressed,
            backgroundColor: onBoardingPrimary1,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
          SizedBox(width: 8),
          // Icon(Icons.arrow_forward, size: 18),
        ],
      ),
    );
  }
}
