// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakil_new/widgets/images.dart';

import '../widgets/colors.dart';
import 'sw_onboarding3.dart';

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

class SWonboarding2 extends StatelessWidget {
  const SWonboarding2({super.key});

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
          'Madhab',
          style: _AppTextStyles.headline,
        ),
        const SizedBox(height: _AppSpacers.verticalSpaceS),
        const Text(
          '(School of Thought)',
          style: _AppTextStyles.subtitle,
        ),
        const SizedBox(height: _AppSpacers.verticalSpaceXXL),
        SvgPicture.asset(swOnboarding2),
        const SizedBox(height: _AppSpacers.verticalSpaceXL),
        SelectableList(
          options: const [
            'Hanafi',
            'Shafi, Maliki, Hambli',
          ],
        ),
        const SizedBox(height: _AppSpacers.verticalSpaceL),
        const GradientButton(),
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
          style: _AppTextStyles.button,
        ),
      ),
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
        _Indicator(isActive: true),
        SizedBox(width: 8),
        _Indicator(isActive: false),
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
        color: isActive ? swHeaderTextColor : indicatorNotActive,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class SelectableList extends StatefulWidget {
  final List<String> options;
  final int initialIndex;
  final Function(int index, String value)? onSelectionChanged;

  const SelectableList({
    super.key,
    required this.options,
    this.initialIndex = 0,
    this.onSelectionChanged,
  });

  @override
  State<SelectableList> createState() => _SelectableListState();
}

class _SelectableListState extends State<SelectableList> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // --- Constants for Styling ---
  static const Color _containerColor = Color(0xFF202A3A);
  static const Color _selectedItemColor = Color(0xFF2E3D56);
  static const LinearGradient selectedGradient = LinearGradient(
    colors: [Color(0xFF2F4866), Color(0xFF1A395E)],
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
  );
  static const LinearGradient nonSelectedGradient = LinearGradient(
    colors: [Color(0xFF2F4866), Color(0xFF1A395E)],
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
  );

  static const Color _textColor = Color(0xFFC1DBFA);
  static const Color _checkColor = Color(0xFFC0C5CC);
  static const double _borderRadius = 12.0;
  static const double _itemPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Container(
        color: _containerColor,
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
            horizontal: _itemPadding,
            vertical: 20.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: _textColor,
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
