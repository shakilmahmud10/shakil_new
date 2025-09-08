// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/challanges.dart';
import 'package:shakil_new/dua_importance.dart';
import 'package:shakil_new/dua_importance_details.dart';
import 'package:shakil_new/task2/quick_icon_components.dart';
import 'reading_dua.dart';
import 'task3/onboarding_flow_screen.dart';
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
              child: const Text("Challenges"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadingDua()),
                );
              },
              child: const Text("Reading Dua"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DuaImportance()),
                );
              },
              child: const Text("Dua Importance"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DuaImportanceDetails(),
                  ),
                );
              },
              child: const Text("Dua Importance Details"),
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
              child: const Text("Icon Components"),
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
                  MaterialPageRoute(builder: (context) => OnboardingFlowScreen()),
                );
              },
              child: const Text("Test2"),
            ),
          ],
        ),
      ),
    );
  }
}
