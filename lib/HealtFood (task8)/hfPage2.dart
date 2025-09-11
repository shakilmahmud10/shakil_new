import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/colors.dart';
import '../widgets/images.dart';
import '../widgets/style.dart';
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
            // Background wave - positioned at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                hfBottomBG, // Your bottom wave background SVG
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),

            // Main scrollable content
            SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: screenHeight - MediaQuery.of(context).padding.top,
                  child: Column(
                    children: [
                      // Top section with back arrow and fruits
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              // Back arrow
                              SvgPicture.asset(hfArrowBackIcon),

                              // const SizedBox(height: 20),

                              // Fruits illustration - centered and scaled appropriately
                              Expanded(
                                child: Center(
                                  child: Container(
                                    width: screenWidth * 1,
                                    height: double.infinity,
                                    child: SvgPicture.asset(
                                      hfFruits, // Your all fruits in single SVG
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Bottom section with text and button (over the wave)
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

                              // Continue button
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
                                      // inner border effect: slightly smaller container with transparent background & light inset border
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.15),
                                            width: 2),
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
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color:
                                            hfSecoundryColor.withOpacity(0.5),
                                        width: 2),
                                  ),
                                  child: Center(
                                    child: Container(
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 8.0),
                                          child: Text('Registration',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: '',
                                                  color: Color(0xFF1D1D1D))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Guest Mode',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: subtleText,
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
