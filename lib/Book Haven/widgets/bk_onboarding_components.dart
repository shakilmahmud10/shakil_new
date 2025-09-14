import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/colors.dart';
import '../../widgets/style.dart';
import '../../widgets/images.dart';

// Page Message Component (header and details)
class BkPageMessage extends StatelessWidget {
  final String header;
  final String details;
  final CrossAxisAlignment alignment;

  const BkPageMessage({
    super.key,
    required this.header,
    required this.details,
    this.alignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: alignment,
      children: [
        Text(
          header,
          textAlign: TextAlign.center,
          style: bkHeaderTextStlye,
        ),
        if (details.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            details,
            textAlign: TextAlign.center,
            style: bkDetailsTextStyle,
          ),
        ],
      ],
    );
  }
}

// Custom Button Component
class BkCustomButton extends StatelessWidget {
  final String text;
  final String? icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final EdgeInsets padding;
  final bool isIconOnly;

  const BkCustomButton({
    super.key,
    this.text = '',
    this.icon,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    this.width = double.infinity,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.isIconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isIconOnly) {
      // Stadium-shaped icon-only button (for welcome pages)
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 100,
            height: 60,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(35),
              border: Border.all(
                color: bhPrimary1.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: icon != null
                    ? SvgPicture.asset(icon!)
                    : const SizedBox(),
              ),
            ),
          ),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SvgPicture.asset(icon!),
                ),
                const SizedBox(width: 8),
              ],
              if (text.isNotEmpty)
                Text(
                  text,
                  style: bkButtonTextStyle.copyWith(color: textColor),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Skip Button Component
class BkSkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const BkSkipButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF64676A),
            decoration: TextDecoration.underline,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}

// Back Button Component
class BkBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const BkBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          bkArrowBackIcon,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            Color(0xFF64676A),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

// Form Field Component
class BkFormField extends StatefulWidget {
  final String label;
  final String hint;
  final String icon;
  final bool isPassword;
  final bool hasToggle;
  final TextInputType inputType;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFocused;

  const BkFormField({
    super.key,
    required this.label,
    this.hint = '',
    required this.icon,
    this.isPassword = false,
    this.hasToggle = false,
    this.inputType = TextInputType.text,
    required this.controller,
    required this.focusNode,
    this.isFocused = false,
  });

  @override
  State<BkFormField> createState() => _BkFormFieldState();
}

class _BkFormFieldState extends State<BkFormField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            widget.label,
            style: bkFormHeading1,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: widget.isFocused
                ? const Color(0xFFFFFFFF)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: widget.isFocused
                  ? bhPrimary1
                  : bhPrimary1.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            obscureText: widget.isPassword && !_passwordVisible,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(widget.icon),
              ),
              suffixIcon: widget.hasToggle && widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(bkEyeSlashIcon),
                      ),
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              hintText: widget.hint,
              hintStyle: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontFamily: 'Inter',
              ),
            ),
            style: bkFormDetails,
          ),
        ),
      ],
    );
  }
}

// Page Indicator Component
class BkPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const BkPageIndicator({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = index == currentIndex;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 20 : 8,
          height: 6,
          decoration: BoxDecoration(
            color: isActive ? bhPrimary1 : bkInactiveIndicator,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}

// Custom Checkbox Component
class BkCustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;

  const BkCustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            checkColor: Colors.white,
            side: const BorderSide(
              color: bhPrimary1,
              width: 2,
            ),
            activeColor: bhPrimary1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: bkFormDetails.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

// Bottom Link Text Component
class BkBottomLinkText extends StatelessWidget {
  final String normalText;
  final String linkText;
  final VoidCallback onTap;

  const BkBottomLinkText({
    super.key,
    required this.normalText,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: normalText,
              style: bkDetailsTextStyle.copyWith(
                fontSize: 14,
                color: bhTextPureDark,
              ),
            ),
            TextSpan(
              text: linkText,
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
    );
  }
}