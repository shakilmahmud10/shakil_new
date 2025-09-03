import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import 'OnboardingPage2.dart';
import 'reusable_onboarding_widgets.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableOnboardingWidget(
      headerText: "সবচেয়ে বড় হাদিসের সম্ভার",
      detailsText: "২৪+ হাদিসের বই এবং ৫০০০০+ হাদিসের কালেকশন আছে এই অ্যাপে",
      buttonNavigator: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage2()),
        );
      },
      mainIcon: Icons.menu_book, // Single icon
      primaryColor: onBoardingPrimary1,
    );
  }
}
