// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/widgets/images.dart';

import '../widgets/colors.dart';

// --- Constants ---

class _AppColors {
  // static const Color background = Color(0xFF0A0E1A);
  // // static const Color gradientStart = Color(0xFF1A233D);
  // static const Color primaryBlue = Color(0xFF4A80F0);
  // static const Color textColor = Colors.white;
  // static const Color headerTextColor = Color(0xFFC1DBFA);
  // static const Color indicatorActive = Color(0xFFC1DBFA);
  // static const Color indicatorNotActive = Color(0xFF7B90A8);
  // static const Color subtitleColor = Color(0xFF516378);
  // static const Color inactiveIndicator = Color(0xFF444B5E);
}

class _AppSpacers {
  static const double screenPadding = 24.0;
  static const double verticalSpaceS = 8.0;
  static const double verticalSpaceM = 16.0;
  static const double verticalSpaceL = 40.0;
  static const double verticalSpaceXL = 50.0;
  static const double verticalSpaceXXL = 60.0;
}

class _AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 30.0,
    fontFamily: '',
    fontWeight: FontWeight.bold,
    color: swHeaderTextColor,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 20.0,
    fontFamily: '',
    fontWeight: FontWeight.normal,
    color: swDetailsTextColor,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    fontFamily: '',
    fontWeight: FontWeight.normal,
    color: swDetailsTextColor,
    height: 1.5,
  );
  static const TextStyle button = TextStyle(
    fontSize: 16.0,
    fontFamily: '',
    fontWeight: FontWeight.w600,
    color: swButtonTextColor,
  );
}

// --- Onboarding Screen ---

class SWonboarding3 extends StatelessWidget {
  const SWonboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF01041F),
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              // Color(0xFF282E66), // Start color
              Color(0xFF080D3F), // Start color
              Color(0xFF01041F),
            ],
          ),
        ),
        child: const SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _AppSpacers.screenPadding),
            child: Column(
              children: [
                Spacer(flex: 6),
                ContentDisplay(),
                Spacer(flex: 9),
                _PageIndicator(),
                Spacer(flex: 3),
                // SizedBox(height: _AppSpacers.verticalSpaceM),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Reusable Widgets ---

class ContentDisplay extends StatelessWidget {
  const ContentDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Notification',
          style: _AppTextStyles.headline,
        ),
        const SizedBox(height: _AppSpacers.verticalSpaceS),
        const Text(
          'Enable notifications to get updates',
          style: _AppTextStyles.subtitle,
        ),
        const SizedBox(height: _AppSpacers.verticalSpaceXXL),
        SvgPicture.asset(swOnboarding3),
        const SizedBox(height: _AppSpacers.verticalSpaceXL),
        NotificationToggleCard(
          title: 'Enable Notifications',
          subtitle: 'Enable notifications to get updates',
          onChanged: (val) {
            print("Notifications toggled: $val");
          },
        ),
        const SizedBox(height: _AppSpacers.verticalSpaceL),
        const GradientButton(),
      ],
    );
  }
}

// --- The Gradient Button Widget ---

class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6FACF2), // Start color
            Color(0xFF3288ED), // End color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ButtonStyle(
          // Make the button's background transparent to show the container's gradient
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          // Remove shadow
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 18),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          // The elevation can be set to 0 as the shadow is transparent
          elevation: WidgetStateProperty.all(0),
        ),
        child: const Text(
          'Continue',
          style: _AppTextStyles.button,
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Indicator(isActive: false),
        SizedBox(width: 8),
        _Indicator(isActive: false),
        SizedBox(width: 8),
        _Indicator(isActive: true),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final bool isActive;

  const _Indicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.0,
      width: isActive ? 80.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? swHeaderTextColor : swDetailsTextColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class NotificationToggleCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const NotificationToggleCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _NotificationToggleCardState createState() => _NotificationToggleCardState();
}

class _NotificationToggleCardState extends State<NotificationToggleCard> {
  late bool isToggled;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1A2B), // solid dark background
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Texts
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC1DBFA),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFC1DBFA).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),

          // Toggle Switch
          CustomToggle(
            initialValue: false,
            onChanged: (value) {
              print("Toggle is now: $value");
            },
          ),
        ],
      ),
    );
  }
}

class CustomToggle extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomToggle({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle>
    with SingleTickerProviderStateMixin {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      _isOn = !_isOn;
    });
    widget.onChanged(_isOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 44,
        height: 25,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isOn ? Colors.blue : Colors.grey.shade600,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _isOn ? Colors.blue : Colors.grey.shade600,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
