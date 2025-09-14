import 'package:flutter/material.dart';
import '../../Core Components/colors.dart';
import '../../Core Components/images.dart';

class BkOnboardingPageData {
  final String title;
  final String description;
  final String? svgIcon;
  final Color backgroundColor;
  final String buttonText;
  final String? buttonIcon;
  final bool hasSkipButton;
  final bool hasBackButton;
  final bool isWelcomePage;
  final bool isLoginPage;
  final bool isSignupPage;
  final bool hasFormFields;
  final List<BkFormField>? formFields;
  final List<BkButton>? buttons;
  final String? bottomText;
  final String? bottomLinkText;

  BkOnboardingPageData({
    required this.title,
    required this.description,
    this.svgIcon,
    required this.backgroundColor,
    required this.buttonText,
    this.buttonIcon,
    this.hasSkipButton = false,
    this.hasBackButton = false,
    this.isWelcomePage = false,
    this.isLoginPage = false,
    this.isSignupPage = false,
    this.hasFormFields = false,
    this.formFields,
    this.buttons,
    this.bottomText,
    this.bottomLinkText,
  });
}

class BkFormField {
  final String label;
  final String hint;
  final String icon;
  final bool isPassword;
  final bool hasToggle;
  final TextInputType inputType;

  BkFormField({
    required this.label,
    this.hint = '',
    required this.icon,
    this.isPassword = false,
    this.hasToggle = false,
    this.inputType = TextInputType.text,
  });
}

class BkButton {
  final String text;
  final String? icon;
  final Color backgroundColor;
  final Color textColor;
  final bool isPrimary;

  BkButton({
    required this.text,
    this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.isPrimary = true,
  });
}

class BkOnboardingData {
  static List<BkOnboardingPageData> get pages => [
        // Page 1 - Welcome
        BkOnboardingPageData(
          title: "Welcome to the Book Haven!",
          description: "Dive into a world of stories. Find your favorite genres and authors with ease.",
          svgIcon: bkOnboarding1,
          backgroundColor: bkBackgroundColor,
          buttonText: "",
          buttonIcon: bkArrowForwordIcon,
          isWelcomePage: true,
        ),
        
        // Page 2 - Literary Oasis
        BkOnboardingPageData(
          title: "Step into the Literary Oasis!",
          description: "Explore a universe of tales. Discover your beloved genres and writers effortlessly.",
          svgIcon: bkOnboarding1,
          backgroundColor: bkBackgroundColor,
          buttonText: "",
          buttonIcon: bkArrowForwordIcon,
          isWelcomePage: true,
        ),
        
        // Page 3 - Magical Library
        BkOnboardingPageData(
          title: "Step into the Magical Library!",
          description: "Explore a world of tales. Discover your beloved genres and authors effortlessly.",
          svgIcon: bkOnboarding1,
          backgroundColor: bkBackgroundColor,
          buttonText: "",
          buttonIcon: bkArrowForwordIcon,
          isWelcomePage: true,
        ),
        
        // Page 4 - Login/Create Account
        BkOnboardingPageData(
          title: "Login/Create your account",
          description: "To save your data, simply log in or create an account using your email or Google.",
          svgIcon: bkOnboarding1,
          backgroundColor: bkBackgroundColor,
          buttonText: "Sign In",
          hasSkipButton: true,
          buttons: [
            BkButton(
              text: "Sign In",
              backgroundColor: bhPrimary1,
              textColor: Colors.white,
              isPrimary: false,
            ),
            BkButton(
              text: "Create Account",
              backgroundColor: bhButtonMutedBg,
              textColor: Colors.black,
              isPrimary: true,
            ),
          ],
        ),
        
        // Page 5 - Login Options
        BkOnboardingPageData(
          title: "Log in your account",
          description: "If you need to save data, Then you can log in with Ird Account or Google Sync.",
          svgIcon: bkOnboarding1,
          backgroundColor: bkBackgroundColor,
          buttonText: "Continue with Email",
          hasSkipButton: true,
          hasBackButton: true,
          buttons: [
            BkButton(
              text: "Continue with Email",
              icon: bkMessage1,
              backgroundColor: bhPrimary1,
              textColor: Colors.white,
              isPrimary: true,
            ),
            BkButton(
              text: "Sync With Google",
              icon: bkGoogleIcon,
              backgroundColor: bhButtonMutedBg,
              textColor: bhTextPureDark,
              isPrimary: false,
            ),
          ],
          bottomText: "Don't Have An Account? ",
          bottomLinkText: "Create Now",
        ),
        
        // Page 6 - Login Form
        BkOnboardingPageData(
          title: "Log in with IRD",
          description: "",
          backgroundColor: bkBackgroundColor,
          buttonText: "Log in",
          hasSkipButton: true,
          hasBackButton: true,
          isLoginPage: true,
          hasFormFields: true,
          formFields: [
            BkFormField(
              label: "Email Account",
              icon: bkMessageOutline1,
              inputType: TextInputType.emailAddress,
            ),
            BkFormField(
              label: "Password",
              icon: bkLockIcon,
              isPassword: true,
              hasToggle: true,
            ),
          ],
          bottomText: "Don't Have An Account? ",
          bottomLinkText: "Create Now",
        ),
        
        // Page 7 - Signup Form
        BkOnboardingPageData(
          title: "Create IRD Account",
          description: "",
          backgroundColor: bkBackgroundColor,
          buttonText: "Submit",
          hasBackButton: true,
          isSignupPage: true,
          hasFormFields: true,
          formFields: [
            BkFormField(
              label: "Email Account",
              icon: bkMessageOutline1,
              inputType: TextInputType.emailAddress,
            ),
            BkFormField(
              label: "Password",
              icon: bkLockIcon,
              isPassword: true,
              hasToggle: true,
            ),
            BkFormField(
              label: "Confirm Password",
              icon: bkLockIcon,
              isPassword: true,
              hasToggle: true,
            ),
          ],
          bottomText: "Already have a IRD account? ",
          bottomLinkText: "Sign In",
        ),
      ];
}