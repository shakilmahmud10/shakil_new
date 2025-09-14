// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/Core%20Components/images.dart';

import '../../Core Components/colors.dart';
import '../../Core Components/style.dart';
import 'sw_onboarding3.dart';

// --- Onboarding Screen ---

class SWonboarding2 extends StatelessWidget {
  const SWonboarding2({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Spacer(flex: 6),
                SwContentDisplay2(),
                Spacer(flex: 9),
                SwPageIndicator2(),
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

class SwContentDisplay2 extends StatelessWidget {
  const SwContentDisplay2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Madhab',
          style: swheadline,
        ),
        const SizedBox(height: 8),
        const Text(
          '(School of Thought)',
          style: swsubtitle,
        ),
        const SizedBox(height: 60),
        SvgPicture.asset(swOnboarding2),
        const SizedBox(height: 50),
        SwSelectableList2(
          options: const [
            'Hanafi',
            'Shafi, Maliki, Hambli',
          ],
        ),
        const SizedBox(height: 40),
        const SwGradientButton2(),
      ],
    );
  }
}

class _EnableLocationButton extends StatelessWidget {
  const _EnableLocationButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(swPrimaryColor),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 18),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: const Text(
          'Enable location permission',
          style: swbutton,
        ),
      ),
    );
  }
}

// --- The Gradient Button Widget ---

class SwGradientButton2 extends StatelessWidget {
  const SwGradientButton2({super.key});

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SWonboarding3(),
            ),
          );
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

class SwPageIndicator2 extends StatelessWidget {
  const SwPageIndicator2();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SwIndicator2(isActive: false),
        SizedBox(width: 8),
        SwIndicator2(isActive: true),
        SizedBox(width: 8),
        SwIndicator2(isActive: false),
      ],
    );
  }
}

class SwIndicator2 extends StatelessWidget {
  final bool isActive;

  const SwIndicator2({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.0,
      width: isActive ? 80.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? swHeaderTextColor : indicatorNotActive,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class SwSelectableList2 extends StatefulWidget {
  final List<String> options;
  final int initialIndex;
  final Function(int index, String value)? onSelectionChanged;

  const SwSelectableList2({
    super.key,
    required this.options,
    this.initialIndex = 0,
    this.onSelectionChanged,
  });

  @override
  State<SwSelectableList2> createState() => _SwSelectableList2State();
}

class _SwSelectableList2State extends State<SwSelectableList2> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // --- Constants for Styling ---
  // static const Color _containerColor = Color(0xFF202A3A);

  // static const Color _textColor = Color(0xFFC1DBFA);
  // static const Color _checkColor = Color(0xFFC0C5CC);
  // static const double _borderRadius = 12.0;
  // static const double _itemPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: Color(0xFF202A3A),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.options.length, (index) {
            final isSelected = _selectedIndex == index;
            final optionText = widget.options[index];

            return _buildOptionItem(
              text: optionText,
              isSelected: isSelected,
              onTap: () {
                if (_selectedIndex != index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onSelectionChanged?.call(index, optionText);
                }
              },
            );
          }),
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: isSelected ? const Color(0xFF1a2f49) : const Color(0xFF142130),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFFC1DBFA),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check,
                  color: Color(0xFF516378),
                  size: 20.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
