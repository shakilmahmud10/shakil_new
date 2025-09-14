class SwOnboardingPageData {
  final String title;
  final String subtitle;
  final String description;
  final String buttonText;
  final String? svgIcon;
  final bool isLocationPage;
  final bool isMadhabPage;
  final bool isNotificationPage;
  final List<String>? madhabOptions;

  const SwOnboardingPageData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.buttonText,
    this.svgIcon,
    this.isLocationPage = false,
    this.isMadhabPage = false,
    this.isNotificationPage = false,
    this.madhabOptions,
  });
}

class SwOnboardingData {
  static const List<SwOnboardingPageData> pages = [
    // Page 1 - Location
    SwOnboardingPageData(
      title: 'Location',
      subtitle: 'Enable location permission',
      description:
          'Enable location permissions to find your local prayer times & calculate qibla directions.',
      buttonText: 'Enable location permission',
      svgIcon: 'assets/images/svg/sw_onboarding/swOnboarding1.svg',
      isLocationPage: true,
    ),

    // Page 2 - Madhab
    SwOnboardingPageData(
      title: 'Madhab',
      subtitle: '(School of Thought)',
      description: '',
      buttonText: 'Continue',
      svgIcon: 'assets/images/svg/sw_onboarding/swOnboarding2.svg',
      isMadhabPage: true,
      madhabOptions: ['Hanafi', 'Shafi, Maliki, Hambli'],
    ),

    // Page 3 - Notification
    SwOnboardingPageData(
      title: 'Notification',
      subtitle: 'Enable notifications to get updates',
      description: '',
      buttonText: 'Continue',
      svgIcon: 'assets/images/svg/sw_onboarding/swOnboarding3.svg',
      isNotificationPage: true,
    ),
  ];
}
