import 'package:flutter/material.dart';
import 'reusable_onboarding_widgets.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableOnboardingWidget(
      headerText: "আমাদের ফিচারসমূহ",
      detailsText: "আমরা অনেকগুলো নতুন ফিচার যুক্ত করেছি। তারমধ্যে অন্যতম - বুকমার্ক, হিফজ, সরাসরি হাদিসে যাওয়া এবং লাস্ট রিড",
      buttonNavigator: () {
        // Navigate to main app or close onboarding
        // Navigator.pushReplacementNamed(context, '/home');
      },
      mainIcon: true, // Multiple icons
      primaryColor: const Color(0xFFF39C12),
    );
  }
}