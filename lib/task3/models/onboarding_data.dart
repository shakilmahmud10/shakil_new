import 'package:flutter/material.dart';
import '../../widgets/colors.dart';
import '../../widgets/images.dart';

class OnboardingPageData {
  final String title;
  final String description;
  final String? description2;
  final String? svgIcon;
  final List<String>? multipleIcons;
  final Color primaryColor;
  final bool isMultiIcon;
  final String buttonText;

  OnboardingPageData({
    required this.title,
    required this.description,
    this.description2,
    this.svgIcon,
    this.multipleIcons,
    required this.primaryColor,
    required this.isMultiIcon,
    required this.buttonText,
  });
}

class OnboardingData {
  static List<OnboardingPageData> get pages => [
    OnboardingPageData(
      title: "সবচেয়ে বড় হাদিসের সম্ভার",
      description: "২৪+ হাদিসের বই এবং ৫০০০০+ হাদিসের কালেকশন আছে এই অ্যাপে",
      svgIcon: onboardingImage1,
      primaryColor: onBoardingPrimary1,
      isMultiIcon: false,
      buttonText: "পরবর্তী",
    ),
    OnboardingPageData(
      title: "আমাদের ফিচারসমূহ",
      description:
          "আমরা অনেকগুলো নতুন ফিচার যুক্ত করেছি। তারমধ্যে অন্যতম - বুকমার্ক, হিফজ, সরাসরি হাদিসে যাওয়া এবং লাস্ট রিড",
      multipleIcons: [
        onboardingIcon1,
        onboardingIcon2,
        onboardingIcon3,
        onboardingIcon4,
      ],
      primaryColor: onBoardingPrimary2,
      isMultiIcon: true,
      buttonText: "পরবর্তী",
    ),
    OnboardingPageData(
      title: "নোটিশ",
      description:
          "We are include many feature in this app. And most important features is Bookmark, Go to Hadith, Hifz, Last Read. ",
      description2:
          "We are include many feature in this app. And most important features is Bookmark, Go to Hadith, Hifz, Last Read. ",
      svgIcon: onboardingImage3,
      primaryColor: onBoardingPrimary3,
      isMultiIcon: false,
      buttonText: "পরবর্তী",
    ),
    OnboardingPageData(
      title: "নোটিফিকেশন",
      description:
          "আল-হাদিস অ্যাপ সম্পর্কিত বিভিন্ন গুরুত্বপুর্ণ নোটিফিকেশন পেতে নিচে \"সম্মতি দিচ্ছি\"বাটনে ক্লিক করুন",
      svgIcon: onboardingImage4,
      primaryColor: onBoardingPrimary2,
      isMultiIcon: false,
      buttonText: "সম্মতি দিচ্ছি",
    ),
    // OnboardingPageData(
    //   title: "ডাটাবেজ লোড করা হচ্ছে",
    //   description:
    //       "দয়া করে কিছুক্ষন অপেক্ষা করুন, ডাটাবেস লোড হয়ে গেলে আপনাকে হাদিস কালেকশন এ নিয়ে যাওয়া হবে।",
    //   svgIcon: onboardingImage5,
    //   primaryColor: onBoardingPrimary4,
    //   isMultiIcon: false,
    //   buttonText: "সম্মতি দিচ্ছি",
    // ),
  ];

  static OnboardingPageData
  get intermediateWarningPageData => OnboardingPageData(
    title: "নোটিফিকেশন",
    description:
        "আল-হাদিস অ্যাপ সম্পর্কিত বিভিন্ন গুরুত্বপুর্ণ নোটিফিকেশন পেতে নিচে \"সম্মতি দিচ্ছি\"বাটনে ক্লিক করুন",
    svgIcon: onboardingImage4,
    primaryColor: onBoardingPrimary2,
    isMultiIcon: false,
    buttonText: "সম্মতি দিচ্ছি",
  );

  static OnboardingPageData get warningPageData => OnboardingPageData(
    title: "ডাটাবেজ লোড করা হচ্ছে",
    description:
        "দয়া করে কিছুক্ষন অপেক্ষা করুন, ডাটাবেস লোড হয়ে গেলে আপনাকে হাদিস কালেকশন এ নিয়ে যাওয়া হবে।",
    svgIcon: onboardingImage5,
    primaryColor: onBoardingPrimary4,
    isMultiIcon: false,
    buttonText: "সম্মতি দিচ্ছি",
  );
}
