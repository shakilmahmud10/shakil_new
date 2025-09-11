// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/task1/challanges.dart';
import 'package:shakil_new/task1/dua_importance.dart';
import 'package:shakil_new/task1/dua_importance_details.dart';
import 'package:shakil_new/task2/quick_icon_components.dart';
import 'task8(HealthyFood)/hfPage1.dart';
import 'task8(HealthyFood)/hfPage3.dart';
import 'task1/reading_dua.dart';
import 'task3/onboarding_flow_screen.dart';
import 'task4/onboarding2.dart';
import 'task5/splash_screen/splash_screen1.dart';
import 'task5/onboarding/QmOnboardingPage1.dart';
import 'task6/bk_onboarding_flow_screen.dart';
import 'task6/onboarding/BkOnboardingPage1.dart';
import 'task7/splashScreen/swSplash2.dart';
import 'task7/onboardingScreen/sw_onboarding1.dart';
import 'widgets/colors.dart';
import 'widgets/style.dart';
import 'widgets/images.dart';

//--------------------------------
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenges',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kButtonGreen,
            foregroundColor: kPureWhite,
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        scaffoldBackgroundColor: kBackgroundColor2,
        fontFamily: 'Poppins',
      ),
      home: const FrontPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Challenges()),
                );
              },
              child: const Text("Challanges (Task1)"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuickIconcomponents(),
                  ),
                );
              },
              child: const Text("Icon Components(Task2)"),
            ),

            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => OnboardingFullPage()),
            //     );
            //   },
            //   child: const Text("Onboarding"),
            // ),

            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Onboardingtest1()),
            //     );
            //   },
            //   child: const Text("Test"),
            // ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingFlowScreen(),
                  ),
                );
              },
              child: const Text("Onboarding1 (Task3)"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageSelectionScreen(),
                  ),
                );
              },
              child: const Text("Onboarding2 (Task4)"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
              child: const Text("Quran Majeed (Task5)"),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BkOnboardingPage1(),
                  ),
                );
              },
              child: const Text("Book Haven (Task6)"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => swSplash2(),
                  ),
                );
              },
              child: const Text("Salat Waqt (Task7)"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HealthyFoodPage1(),
                  ),
                );
              },
              child: const Text("Salat Waqt (Task8)"),
            ),
          ],
        ),
      ),
    );
  }
}
