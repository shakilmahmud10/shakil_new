import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Core Components/colors.dart';
import '../Core Components/images.dart';
import '../Core Components/style.dart';
import 'hfPage3.dart';

/// ---------------------------
/// Main Healthy Food Discovery Screen
/// ---------------------------
class HealthyFoodPage2 extends StatefulWidget {
  const HealthyFoodPage2({super.key});

  @override
  State<HealthyFoodPage2> createState() => _HealthyFoodPage2State();
}

class _HealthyFoodPage2State extends State<HealthyFoodPage2> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(
  body: Container(
    width: double.infinity,
    height: double.infinity,
    color: hfbackground,
    child: Stack(
      children: [
        /// === Background wave (bottom) ===
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            hfBottomBG,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
        ),

        /// === Fruits Background (Full screen) ===
        Positioned(
          top: screenWidth*0.1,
          left: 0,
          right: 0,

          child: SvgPicture.asset(
            hfFruits2,
            fit: BoxFit.cover,
          ),
        ),

        /// === Center Logo ===
        Positioned(
          top: screenWidth*0.4,
          left: screenWidth*0.2,
          right: screenWidth*0.2,
          child: Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              hfLogo,
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
            ),
          ),
        ),

        /// === Foreground Content (scrollable) ===
        SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight - MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 20),
                          // SvgPicture.asset(hfArrowBackIcon),
                        ],
                      ),
                    ),
                  ),

                  // Bottom section with text + button
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),

                          /// === Login button ===
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HealthyFoodPage3(),
                                ),
                              );
                            },
                            child: Container(
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                color: hfButtonColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.15),
                                      width: 2,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 8.0),
                                      child: Text('Login', style: sfbutton),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// === Registration button ===
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: hfSecoundryColor.withOpacity(0.5),
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 8.0),
                                  child: Text(
                                    'Registration',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF1D1D1D),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// === Guest mode text ===
                          Text(
                            'Guest Mode',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  const Color(0xFF465105).withOpacity(0.6),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}
