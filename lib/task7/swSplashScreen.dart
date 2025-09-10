import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim Prayer Time',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true, // Material 3 ডিজাইন ব্যবহার করুন
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SwSplashscreen(),
        '/location': (context) => LocationPage(),
        '/madhab': (context) => MadhabPlaceholderPage(),
      },
    );
  }
}

// Constants
class AppColors {
  static const Color backgroundStart = Color(0xFF0A0F18);
  static const Color backgroundEnd = Color(0xFF000000);
  static const Color primaryBlue = Color(0xFF5EA0FF);
  static const Color textPrimary = Color(0xFFE6F0FF);
  static const Color textSecondary = Color(0xFF8EA4C6);
  static const Color indicatorInactive = Color(0xFF243145);
  static const Color indicatorActive = Color(0xFFA9C7FF);
  static const Color buttonBackground = Color(0xFF397BFF);
}

class AppIcons {
  static const IconData mosque = Icons.mosque;
  static const IconData location = Icons.location_on;
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 0.8,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 0.3,
    height: 1.4,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

class Gaps {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 48.0;
}

class AppRadii {
  static const double small = 4.0;
  static const double medium = 8.0;
  static const double large = 16.0;
  static const double pill = 25.0;
}

class SwSplashscreen extends StatefulWidget {
  @override
  _SwSplashscreenState createState() => _SwSplashscreenState();
}

class _SwSplashscreenState extends State<SwSplashscreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed ব্যবহার করা নিরাপদ
    Future.delayed(const Duration(milliseconds: 1000), () {
      // mounted চেক করে context নিরাপদ কিনা নিশ্চিত করুন
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/location');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundStart,
              AppColors.backgroundEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon section
                    SvgPicture.asset('assets/images/svg/salatWaqt/masque.svg'),    
                    const SizedBox(height: Gaps.large),

                    // Title
                    const Text(
                      'Muslim Prayer Time',
                      style: AppTextStyles.title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Gaps.small),

                    // Subtitle
                    const Text(
                      'IRD Foundation',
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Bottom indicator bars
              Padding(
                padding: const EdgeInsets.only(bottom: Gaps.extraLarge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 5,
                      height: index == 2
                          ? 24
                          : (index == 1 || index == 3 ? 20 : 16),
                      decoration: BoxDecoration(
                        color: AppColors.indicatorInactive,
                        borderRadius: BorderRadius.circular(AppRadii.small),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundStart,
              AppColors.backgroundEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Gaps.large),
            child: Column(
              children: [
                const SizedBox(height: Gaps.extraLarge),

                // Header
                const Text(
                  'Location',
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Gaps.small),

                const Text(
                  'Enable location permission',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // Icon
                      Icon(
                        AppIcons.location,
                        size: 120,
                        color: AppColors.primaryBlue,
                      ),
                      SizedBox(height: Gaps.extraLarge),

                      // Body text
                      Text(
                        'Enable location permissions to find your local prayer times & calculate qibla directions.',
                        style: AppTextStyles.bodyText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Primary CTA - ElevatedButton ব্যবহার করুন
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/madhab');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBackground,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadii.pill),
                      ),
                    ),
                    child: const Text(
                      'Enable location permission',
                      style: AppTextStyles.buttonText,
                    ),
                  ),
                ),

                const SizedBox(height: Gaps.extraLarge),

                // Progress dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: index == 0 ? 32 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? AppColors.indicatorActive
                            : AppColors.indicatorInactive,
                        borderRadius: BorderRadius.circular(AppRadii.small),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: Gaps.extraLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Placeholder for next page
class MadhabPlaceholderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundEnd,
      body: const Center(
        child: Text(
          'Madhab Page (placeholder)',
          style: AppTextStyles.title,
        ),
      ),
    );
  }
}
