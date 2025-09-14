import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Core Components/colors.dart';
import '../Core Components/text_style.dart';
import '../Core Components/images.dart';

// --- App Constants ---

class AppColors {
  static const Color backgroundGradientStart = Color(0xFFF7FCFA);
  static const Color backgroundGradientEnd = Color(0xFFEEF8F3);
  // static const Color primaryGreen = Color(0xFF4A7C67);
  static const Color textDark = Color(0xFF1E1E1E);
  static const Color textLight = Color(0xFFB0B0B0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    color: kPrimaryGreen,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: "HindSiliguri",
  );

  static const TextStyle skipButton = TextStyle(
    color: AppColors.textLight,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: "HindSiliguri",
  );

  static const TextStyle languageText = TextStyle(
    color: AppColors.textDark,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: "HindSiliguri",
  );

  static const TextStyle continueButton = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: "HindSiliguri",
  );
}

class AppSpacing {
  static const double horizontalPadding = 24.0;
  static const double verticalPadding = 16.0;
}

// --- Data Model ---

class Language {
  final String name;
  final String flagEmoji;

  const Language({required this.name, required this.flagEmoji});
}

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen>
    with WidgetsBindingObserver {
  Timer? _navigationBarTimer;

  // Language data using new model
  final List<Language> _languages = const [
    Language(name: 'English', flagEmoji: '🇺🇸'),
    Language(name: 'Bangla', flagEmoji: '🇧🇩'),
    Language(name: 'Arabic', flagEmoji: '🇸🇦'),
    Language(name: 'Urdu', flagEmoji: '🇵🇰'),
    Language(name: 'Hindi', flagEmoji: '🇮🇳'),
  ];

  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _selectedLanguage = _languages.first.name;
    _hideStatusBar();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _navigationBarTimer?.cancel();
    _showStatusBar();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Restore transparent status bar when app regains focus
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _hideStatusBar();
        }
      });
    }
  }

  void _hideStatusBar() {
    // Show status bar elements but hide background (transparent effect)
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
    // Make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  void _startNavigationBarHideTimer() {
    // Cancel any existing timer
    _navigationBarTimer?.cancel();

    // Start a new timer to hide navigation bar after 2 seconds
    _navigationBarTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [SystemUiOverlay.top],
        );
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
      }
    });
  }

  void _onLanguageSelected(String languageName) {
    setState(() {
      _selectedLanguage = languageName;
    });
    _startNavigationBarHideTimer();
  }

  void _onContinuePressed() {
    _startNavigationBarHideTimer();
    // Handle continue action here
    // For now, just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected language: $_selectedLanguage'),
        backgroundColor: onBoardingPrimary1,
      ),
    );
  }

  void _onBackPressed() {
    _startNavigationBarHideTimer();
    Navigator.pop(context);
  }

  void _onSkipPressed() {
    _startNavigationBarHideTimer();
    // Handle skip action here
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Also start timer on any tap to handle other interactions
        _startNavigationBarHideTimer();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPureWhite,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Select Language',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: kTextDark,
            ),
          ),
          actions: const [
            Text('Skip', style: AppTextStyles.skipButton),
          ],
        ),
        body: Container(
          color: kBackgroundColor2,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalPadding,
              ),
              child: Column(
                children: [
                  const _CustomAppBar(),
                  const SizedBox(height: 60),
                  const Icon(
                    Icons.image_outlined,
                    size: 120,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 60),
                  _buildLanguageList(),
                  const Spacer(),
                  _ContinueButton(onPressed: _onContinuePressed),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageList() {
    return Column(
      children: _languages.map((language) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _onLanguageSelected(language.name),
            borderRadius: BorderRadius.circular(30),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: _LanguageListItem(
              language: language,
              isSelected: _selectedLanguage == language.name,
            ),
          ),
        );
      }).toList(),
    );
  }
}

// --- Reusable Widgets ---

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.verticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: kPrimaryGreen),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Text('Select Language', style: AppTextStyles.appBarTitle),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Skip', style: AppTextStyles.skipButton),
          ),
        ],
      ),
    );
  }
}

class _LanguageListItem extends StatelessWidget {
  final Language language;
  final bool isSelected;

  const _LanguageListItem({required this.language, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(language.flagEmoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 16),
            Text(language.name, style: AppTextStyles.languageText),
            const Spacer(),
            const Icon(Icons.check, color: kPrimaryGreen, size: 20),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Text(language.flagEmoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 16),
            Text(language.name, style: AppTextStyles.languageText),
          ],
        ),
      );
    }
  }
}

class _ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ContinueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryGreen,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: const Text('Continue', style: AppTextStyles.continueButton),
      ),
    );
  }
}
