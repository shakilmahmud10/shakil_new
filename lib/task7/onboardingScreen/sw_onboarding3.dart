// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/widgets/images.dart';

import '../../widgets/colors.dart';
import '../../widgets/style.dart';

// --- Onboarding Screen ---

class SWonboarding3 extends StatelessWidget {
  const SWonboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF01041F),
          gradient: swsplashBGGradient1,
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Spacer(flex: 6),
                SwContentDisplay3(),
                Spacer(flex: 9),
                SwPageIndicator3(),
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

class SwContentDisplay3 extends StatelessWidget {
  const SwContentDisplay3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Notification',
          style: swheadline,
        ),
        const SizedBox(height: 8),
        const Text(
          'Enable notifications to get updates',
          style: swsubtitle,
        ),
        const SizedBox(height: 60),
        SvgPicture.asset(swOnboarding3),
        const SizedBox(height: 50),
        SwNotificationToggleCard3(
          title: 'Enable Notifications',
          subtitle: 'Enable notifications to get updates',
          onChanged: (val) {
            print("Notifications toggled: $val");
          },
        ),
        const SizedBox(height: 40),
        const SwGradientButton3(),
      ],
    );
  }
}

// --- The Gradient Button Widget ---

class SwGradientButton3 extends StatelessWidget {
  const SwGradientButton3({super.key});

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
          style: swbutton,
        ),
      ),
    );
  }
}

class SwPageIndicator3 extends StatelessWidget {
  const SwPageIndicator3();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SwIndicator3(isActive: false),
        SizedBox(width: 8),
        SwIndicator3(isActive: false),
        SizedBox(width: 8),
        SwIndicator3(isActive: true),
      ],
    );
  }
}

class SwIndicator3 extends StatelessWidget {
  final bool isActive;

  const SwIndicator3({required this.isActive});

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

class SwNotificationToggleCard3 extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwNotificationToggleCard3({
    Key? key,
    required this.title,
    required this.subtitle,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SwNotificationToggleCard3State createState() =>
      _SwNotificationToggleCard3State();
}

class _SwNotificationToggleCard3State extends State<SwNotificationToggleCard3> {
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
          SwCustomToggle3(
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

class SwCustomToggle3 extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwCustomToggle3({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<SwCustomToggle3> createState() => _SwCustomToggle3State();
}

class _SwCustomToggle3State extends State<SwCustomToggle3>
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
