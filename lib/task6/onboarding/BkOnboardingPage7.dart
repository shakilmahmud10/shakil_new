import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/colors.dart';
import '../../widgets/style.dart';
import '../../widgets/text_style.dart';
import '../../widgets/images.dart';

class BkOnboardingPage7 extends StatefulWidget {
  const BkOnboardingPage7({super.key});

  @override
  State<BkOnboardingPage7> createState() => _BkOnboardingPage7State();
}

class _BkOnboardingPage7State extends State<BkOnboardingPage7>
    with WidgetsBindingObserver {
  Timer? _navigationBarTimer;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  bool _rememberMe = false;
  bool _passwordVisible = false;

  // Unified focus management
  String? _activeFocusField;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setupStatusBar();

    // Add unified focus listeners
    _emailFocusNode.addListener(_updateFocusState);
    _passwordFocusNode.addListener(_updateFocusState);
    _confirmPasswordFocusNode.addListener(_updateFocusState);
  }

  @override
  void dispose() {
    _navigationBarTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _setupStatusBar();
    }
  }

  void _setupStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
    ));
    _startNavigationBarHideTimer();
  }

  void _startNavigationBarHideTimer() {
    _navigationBarTimer?.cancel();
    _navigationBarTimer = Timer(const Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top],
      );
    });
  }

  void _onBackPressed() {
    debugPrint('Back button pressed');
    Navigator.pop(context);
  }

  void _onSkipPressed() {
    debugPrint('Skip button pressed');
    // Navigate to main app or complete onboarding
  }

  void _onLogInPressed() {
    _startNavigationBarHideTimer();
    debugPrint('Log In button pressed');
    // Handle login logic
  }

  void _onCreateNowPressed() {
    debugPrint('Create Now pressed');
    // Navigate to account creation
  }

  void _onForgotPasswordPressed() {
    debugPrint('Forgot Password pressed');
    // Navigate to password recovery
  }

  // Update focus state based on which field is currently focused
  void _updateFocusState() {
    setState(() {
      if (_emailFocusNode.hasFocus) {
        _activeFocusField = 'email';
      } else if (_passwordFocusNode.hasFocus) {
        _activeFocusField = 'password';
      } else if (_confirmPasswordFocusNode.hasFocus) {
        _activeFocusField = 'confirmPassword';
      } else {
        _activeFocusField = null;
      }
    });
  }

  // Helper method to check if a field is focused
  bool _isFieldFocused(String fieldName) {
    return _activeFocusField == fieldName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bkBackgroundColor,
      body: Column(
        children: [
          // Top navigation bar
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // Back button
          //       InkWell(
          //         onTap: _onBackPressed,
          //         borderRadius: BorderRadius.circular(4),
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: SvgPicture.asset(
          //             bkArrowBackIcon,
          //             width: 24,
          //             height: 24,
          //             colorFilter: const ColorFilter.mode(
          //               Color(0xFF64676A),
          //               BlendMode.srcIn,
          //             ),
          //           ),
          //         ),
          //       ),

          //       // Skip button
          //       InkWell(
          //         onTap: _onSkipPressed,
          //         borderRadius: BorderRadius.circular(4),
          //         child: const Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: Text(
          //             'Skip',
          //             style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w400,
          //               color: Color(0xFF64676A),
          //               decoration: TextDecoration.underline,
          //               fontFamily: 'Inter',
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Main content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Login form container
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: bhPrimary1.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            const Center(
                              child: Text(
                                'Log in with IRD',
                                style: bkHeaderTextStlye,
                              ),
                            ),
                            const SizedBox(height: 32),

                            // Email field
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Email Account',
                                style: bkFormHeading1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: _isFieldFocused('email')
                                    ? const Color(0xFFFFFFFF)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: _isFieldFocused('email')
                                      ? bhPrimary1
                                      : bhPrimary1.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      bkMessageOutline1,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF9CA3AF),
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                style: bkFormDetails,
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Password field
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Password',
                                style: bkFormHeading1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: _isFieldFocused('password')
                                    ? const Color(0xFFFFFFFF)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: _isFieldFocused('password')
                                      ? bhPrimary1
                                      : bhPrimary1.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      bkLockIcon,
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    // onTap: () {
                                    //   setState(() {
                                    //     _passwordVisible = !_passwordVisible;
                                    //   });
                                    // },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(bkEyeSlashIcon),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                ),
                                style: bkFormDetails,
                              ),
                            ),

                            const SizedBox(height: 30),

                            //Confirm Password field
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Confirm Password',
                                style: bkFormHeading1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: _isFieldFocused('confirmPassword')
                                    ? const Color(0xFFFFFFFF)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: _isFieldFocused('confirmPassword')
                                      ? bhPrimary1
                                      : bhPrimary1.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: _confirmPasswordController,
                                focusNode: _confirmPasswordFocusNode,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      bkLockIcon,
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    // onTap: () {
                                    //   setState(() {
                                    //     _passwordVisible = !_passwordVisible;
                                    //   });
                                    // },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(bkEyeSlashIcon),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                ),
                                style: bkFormDetails,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Remember me and Forgot password row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Remember me checkbox
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Checkbox(
                                          value: _rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _rememberMe = value ?? false;
                                            });
                                          },
                                          checkColor:
                                              Colors.white, // Tick color
                                          side: const BorderSide(
                                            // Normal border color
                                            color: bhPrimary1,
                                            width: 2,
                                          ),
                                          activeColor: bhPrimary1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'I accept all Term of Conditions.',
                                        style: bkFormDetails.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // // Forgot password
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 8.0),
                                //   child: InkWell(
                                //     onTap: _onForgotPasswordPressed,
                                //     child: Text(
                                //       'Forgot Password?',
                                //       style: bkFormDetails.copyWith(
                                //         fontSize: 14,
                                //         decoration: TextDecoration.underline,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 40),

                            // Log In button
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: bhPrimary1,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: bkButtonTextStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Create Now text
                      GestureDetector(
                        onTap: _onCreateNowPressed,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have a ird account? ",
                                style: bkDetailsTextStyle.copyWith(
                                  fontSize: 14,
                                  color: bhTextPureDark,
                                ),
                              ),
                              TextSpan(
                                text: "Sign In",
                                style: bkDetailsTextStyle.copyWith(
                                  fontSize: 14,
                                  color: bhTextPureDark,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
