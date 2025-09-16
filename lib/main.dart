// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/Challanges/challanges.dart';
import 'package:shakil_new/Icon%20Components/quick_icon_components.dart';
import 'package:shakil_new/dua_ruqyah/dua.dart';
import 'Dua and Ruqyah/drawer.dart';
import 'Dua and Ruqyah/quranGeneralSetting.dart';
import 'Food Blog/hfPage1.dart';
import 'Al Hadith/onboarding_flow_screen.dart';
import 'Dua and Ruqyah/onboarding2.dart';
import 'Quran Majeed/splash_screen/splash_screen1.dart';
import 'Book Haven/onboarding/BkOnboardingPage1.dart';
import 'Muslim Prayer Time/splashScreen/swSplash2.dart';
import 'Core Components/colors.dart';
import 'reuseable_widget/reuseableWidget.dart';

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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Dua(),
                    // builder: (context) => const DuaNewFile(),
                  ),
                );
              },
              child: const Text("Dua Ruqyah"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Reuseablewidget(),
                  ),
                );
              },
              child: const Text("Reusable Widgets(Task9)"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Qurangeneralsetting(),
                  ),
                );
              },
              child: const Text("Setting Drawer"),
            ),
          ],
        ),
      ),
    );
  }
}
