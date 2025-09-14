import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Core Components/colors.dart';
import '../Core Components/images.dart';
import '../Core Components/style.dart';
import 'hfPage2.dart';

/// ---------------------------
/// Main Healthy Food Discovery Screen
/// ---------------------------
class HealthyFoodPage1 extends StatefulWidget {
  const HealthyFoodPage1({super.key});

  @override
  State<HealthyFoodPage1> createState() => _HealthyFoodPage1State();
}

class _HealthyFoodPage1State extends State<HealthyFoodPage1> {
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

            /// === Fruits Background (Full screen) ===
            Positioned(
              top: screenWidth * 0.2,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                hfFruits,
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
                      // Expanded(
                      //   flex: 3,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         const SizedBox(height: 20),
                      //         // Back arrow
                      //         // SvgPicture.asset(hfArrowBackIcon),

                      //         // const SizedBox(height: 20),

                      //         // Fruits illustration - centered and scaled appropriately
                      //         Expanded(
                      //           child: Center(
                      //             child: Container(
                      //               width: screenWidth * 1,
                      //               height: double.infinity,
                      //               // height: screenHeight * 0.35,
                      //               child: SvgPicture.asset(
                      //                 hfFruits, // Your all fruits in single SVG
                      //                 fit: BoxFit.contain,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

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

                      // Bottom section with text and button (over the wave)
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Main title
                              Text(
                                'Discover The Secrets\nOf Healthy Eating',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Karma',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  height: 1.3,
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Subtitle
                              Text(
                                'Discover Delicious, Healthy, And Sustainable\nFood Choices With Us.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xFF333333),
                                  height: 1.4,
                                ),
                              ),

                              const SizedBox(height: 40),

                              // Continue button
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HealthyFoodPage2(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 44,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: hfButtonColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Container(
                                        // inner border effect: slightly smaller container with transparent background & light inset border
                                        // margin: const EdgeInsets.symmetric(
                                        //     horizontal: 2, vertical: 2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                              width: 2),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 8.0),
                                            child:
                                                SvgPicture.asset(hfArrowGroup),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
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
