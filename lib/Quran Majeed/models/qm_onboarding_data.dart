import 'package:flutter/material.dart';
import '../../Core Components/colors.dart';
import '../../Core Components/images.dart';

class QmOnboardingPageData {
  final String title;
  final String description;
  final String? svgIcon;
  final Color backgroundColor;
  final String buttonText;
  final bool isLanguageSelection;
  final bool isProgressLoader;
  final List<String>? languages;

  QmOnboardingPageData({
    required this.title,
    required this.description,
    this.svgIcon,
    required this.backgroundColor,
    required this.buttonText,
    this.isLanguageSelection = false,
    this.isProgressLoader = false,
    this.languages,
  });
}

class QmOnboardingData {
  static List<QmOnboardingPageData> get pages => [
        QmOnboardingPageData(
          title: "Best Feature in This App",
          description:
              "We have added many new features like Bookmark, Hifz, Word by Word, Quranic Audio, Go Directly to Ayah and Last Read etc.",
          svgIcon: qmOnboarding1,
          backgroundColor: splashBG1,
          buttonText: "Next",
        ),
        QmOnboardingPageData(
          title: "We Will Send You Some Important Notice",
          description:
              "Please allow notification for Quran Mazid daily ayah, important notice, and update notifications.",
          svgIcon: qmOnboarding2,
          backgroundColor: splashBG1,
          buttonText: "Allow",
        ),
        QmOnboardingPageData(
          title: "Enable Local Storage For Easy Bookmark Recovery",
          description:
              "Allowing this permission helps us save your bookmarks locally. If you uninstall the app by mistake, your saved data will be restored when you reinstall.",
          svgIcon: qmOnboarding3,
          backgroundColor: splashBG1,
          buttonText: "Next",
        ),
        QmOnboardingPageData(
          title: "Select Language",
          description:
              "Translations, Tafsir and Word by Word language will be automatically selected based on your language selection.",
          backgroundColor: splashBG1,
          buttonText: "Confirm",
          isLanguageSelection: true,
          languages: [
            'English (US)',
            'Bangla',
            'Arabic',
            'Hindi',
            'Urdu',
            'Persian',
            'Bahasa',
          ],
        ),
        QmOnboardingPageData(
          title: "Please Wait Sometime",
          description:
              "We are optimizing this app based on your selected language, please wait sometime",
          svgIcon: qmOnboarding5,
          backgroundColor: splashBG1,
          buttonText: "Continue",
          isProgressLoader: true,
        ),
      ];
}
