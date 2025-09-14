import 'dart:math' as math;
import 'package:flutter/material.dart';

// --- Constants for styling and layout ---

const Color kPrimaryColor = Color(0xFF26A69A);
const Color kBackgroundColor = Color(0xFF4A4A4A);
const Color kMenuItemColor = Color(0xFFF5F5F5);
const Color kMenuTextColor = Color(0xFF333333);

const Duration kAnimationDuration = Duration(milliseconds: 300);

const double kMenuItemSpacing = 85.0;

class IconWidget extends StatefulWidget {
  const IconWidget({super.key});

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _expandAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    // Use a curved animation for a more dynamic effect.
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Toggles the menu's expanded/collapsed state.
  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SizedBox(
          // Define a bounding box for the menu and its items
          width: 250,
          height: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // The individual menu items that appear when expanded.
              _buildMenuItem(angle: -90, child: _buildOption1()),
              _buildMenuItem(angle: 180, child: _buildOption2()),
              _buildMenuItem(angle: 90, child: _buildOption3()),
              // The main button that is always visible.
              _buildMainButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the main floating action button that controls the menu.
  Widget _buildMainButton() {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: _toggleMenu,
        elevation: 4.0,
        shape: const CircleBorder(),
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _expandAnimation,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  /// A wrapper widget that positions and animates each menu item.
  Widget _buildMenuItem({required double angle, required Widget child}) {
    // Convert angle from degrees to radians for trigonometric functions.
    final double radians = angle * (math.pi / 180.0);
    return AnimatedBuilder(
      animation: _expandAnimation,
      builder: (context, _) {
        // Only show items if the animation has started.
        if (_expandAnimation.value == 0) {
          return const SizedBox.shrink();
        }
        return Transform.translate(
          offset: Offset.fromDirection(
            radians,
            _expandAnimation.value * kMenuItemSpacing,
          ),
          child: Opacity(
            opacity: _expandAnimation.value,
            child: child,
          ),
        );
      },
    );
  }

  /// Builds the "Full Screen" menu item.
  Widget _buildOption1() {
    return const _MenuItem(
      icon: Icon(Icons.mic_none, color: kMenuTextColor, size: 22),
      text: 'Full Screen',
    );
  }

  /// Builds the "View Change" menu item with a custom icon style.
  Widget _buildOption2() {
    return const _MenuItem(
      icon: CircleAvatar(
        radius: 12,
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.mic, color: Colors.white, size: 14),
      ),
      text: 'View Change',
    );
  }

  /// Builds the "With Zabar,Zer" menu item.
  Widget _buildOption3() {
    return const _MenuItem(
      icon: Icon(Icons.mic_none, color: kMenuTextColor, size: 22),
      text: 'With Zabar,Zer',
    );
  }
}

/// A reusable widget for the styled, pill-shaped menu item buttons.
class _MenuItem extends StatelessWidget {
  final Widget icon;
  final String text;

  const _MenuItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kMenuItemColor,
      elevation: 2.0,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 10.0),
            Text(
              text,
              style: const TextStyle(
                color: kMenuTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
