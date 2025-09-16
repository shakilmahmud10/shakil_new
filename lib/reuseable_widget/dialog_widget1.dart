import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

/// App-wide colors (explicit hex codes).
class AppPalette {
  // Surfaces
  static const Color card = Color(0xFFFFFFFF);
  static const Color pageBg = Color(0xFFF5F7F8);
  static const Color shadow = Color(0x1A000000); // 10% black

  // Text
  static const Color title = Color(0xFF2F3A3D);
  static const Color body = Color(0xFF6F7C80);
  static const Color hint = Color(0xFF97A0A3);

  // Accents
  static const Color accentTeal = Color(0xFF37C6A3);
  static const Color accentTealDark = Color(0xFF2AB294);
  static const Color danger = Color(0xFFFF6B6B);
  static const Color dangerDark = Color(0xFFE65454);

  // Soft background tints for decor (ARGB with alpha)
  static const Color tealSoft = Color(0x2237C6A3); // ~13% teal
  static const Color redSoft = Color(0x22FF6B6B); // ~13% red
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reusable Alert Dialog Card',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppPalette.pageBg,
        // Disable splash/highlight globally per request.
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const DialogWidget1(),
    );
  }
}

class DialogWidget1 extends StatelessWidget {
  const DialogWidget1({super.key});

  void _showLogoutDialog(BuildContext context) {
    CustomAlertDialogwithBG.show(
      context: context,
      svgIcon: 'assets/images/svg/reusableWidget/log-out 1.svg',
      decor: SvgPicture.asset(
        'assets/images/svg/reusableWidget/dialogCardBG.svg',
      ),
      decorAlignment: Alignment.bottomLeft,
      title: 'লগ আউট করুন',
      message: 'আপনি কি লগআউট করতে চান?',
      primaryLabel: 'Confirm',
      onPrimary: () => Navigator.of(context).pop(),
      secondaryLabel: 'Cancel',
      onSecondary: () => Navigator.of(context).pop(),
      // accentColor: AppPalette.accentTeal,
      actionsStyle: AlertActionsStyle.doubleText,
      maxWidth: 332,
      // decorOpacity: 0.3,  // Optional: control background opacity
    );
  }

  void _showForceUpdateDialog(BuildContext context) {
    CustomAlertDialogwithBG.show(
      context: context,
      svgIcon: 'assets/images/svg/reusableWidget/log-out 1.svg',
      decor: SvgPicture.asset(
        'assets/images/svg/reusableWidget/dialogCardBG.svg',
      ),
      decorAlignment: Alignment.bottomLeft,
      title: 'অ্যাপ আপডেট করুন',
      message:
          'আমাদের অ্যাপের বড় ধরনের আপডেট এসেছে। এখনই অ্যাপটি আপডেট করে নিন এবং উপভোগ করুন নতুন সব ফিচার ও চমৎকার ইউজার এক্সপেরিয়েন্স।',
      primaryLabel: 'Update Now',
      onPrimary: () => Navigator.of(context).pop(),
      accentColor: AppPalette.accentTeal,
      actionsStyle: AlertActionsStyle.singleFilled,
      maxWidth: 360,
    );
  }

  void _showDeleteDialog(BuildContext context) {
    CustomAlertDialogwithBG.show(
      context: context,
      svgIcon: 'assets/images/svg/reusableWidget/delete 1.svg',
      decor: SvgPicture.asset(
        'assets/images/svg/reusableWidget/dialogCardBG.svg',
      ),
      decorAlignment: Alignment.bottomLeft,
      title: 'বুকমার্ক ডিলেট',
      message: 'আপনি কি বুকমার্ক ফোল্ডারটি ডিলিট করতে চান?',
      primaryLabel: 'Delete',
      onPrimary: () => Navigator.of(context).pop(),
      secondaryLabel: 'Cancel',
      onSecondary: () => Navigator.of(context).pop(),
      accentColor: AppPalette.danger,
      actionsStyle: AlertActionsStyle.doubleText,
      maxWidth: 332,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
      color: AppPalette.title,
    );

    ButtonStyle centerBtnStyle(Color bg) => TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          backgroundColor: bg,
          foregroundColor: AppPalette.title,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          overlayColor: Colors.transparent,
        );

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: centerBtnStyle(const Color(0xFFFFFFFF)),
                onPressed: () => _showLogoutDialog(context),
                child: Text('Dialog 1', style: buttonTextStyle),
              ),
              const SizedBox(width: 16),
              TextButton(
                style: centerBtnStyle(const Color(0xFFFFFFFF)),
                onPressed: () => _showForceUpdateDialog(context),
                child: Text('Dialog 2', style: buttonTextStyle),
              ),
              const SizedBox(width: 16),
              TextButton(
                style: centerBtnStyle(const Color(0xFFFFFFFF)),
                onPressed: () => _showDeleteDialog(context),
                child: Text('Dialog 3', style: buttonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Actions layout options.
enum AlertActionsStyle { doubleText, singleFilled }

/// Reusable alert dialog card with optional background decor widget.
/// No CustomPainter is used.
class AlertDialogCard extends StatelessWidget {
  const AlertDialogCard({
    super.key,
    // Required
    required this.title,
    required this.primaryLabel,
    required this.onPrimary,
    // Optional content
    this.message,
    this.svgIcon, // <-- নতুন
    // Optional actions
    this.secondaryLabel,
    this.onSecondary,
    this.actionsStyle = AlertActionsStyle.doubleText,
    // Visual config
    this.accentColor = AppPalette.accentTeal,
    this.maxWidth = 340,
    // New background decor
    this.decor,
    this.decorAlignment = Alignment.bottomLeft,
  });

  // Content
  final String title;
  final String? message;
  final String? svgIcon; // <-- নতুন

  // Actions
  final String primaryLabel;
  final VoidCallback onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final AlertActionsStyle actionsStyle;

  // Visual config
  final Color accentColor;
  final double maxWidth;

  // Background decoration widget
  final Widget? decor;
  final Alignment decorAlignment;

  @override
  Widget build(BuildContext context) {
    final bool isDanger = accentColor.value == AppPalette.danger.value;

    // Typography
    const titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: AppPalette.title,
      height: 1.25,
    );

    const messageStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppPalette.body,
      height: 1.6,
    );

    const actionLeftStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppPalette.hint,
    );

    final actionRightStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: accentColor,
    );

    return Material(
      type: MaterialType.transparency,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppPalette.card,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: AppPalette.shadow,
                blurRadius: 28,
                offset: Offset(0, 14),
              ),
            ],
          ),
          child: Stack(
            children: [
              if (decor != null)
                Positioned.fill(
                  child: Align(
                    alignment: decorAlignment,
                    child: IgnorePointer(child: decor!),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (svgIcon != null) ...[
                      Container(
                        // width: 76,
                        // height: 76,
                        // decoration: BoxDecoration(
                        //   color: (isDanger
                        //       ? const Color(0xFFFFEFEF)
                        //       : const Color(0xFFE9F8F4)),
                        //   shape: BoxShape.circle,
                        // ),
                        child: Center(
                          child: SvgPicture.asset(
                            svgIcon!,
                            width: 40,
                            height: 40,
                            // colorFilter: ColorFilter.mode(
                            //   isDanger
                            //       ? AppPalette.danger
                            //       : AppPalette.accentTeal,
                            //   BlendMode.srcIn,
                            // ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                    Text(title, textAlign: TextAlign.center, style: titleStyle),
                    if (message != null) ...[
                      const SizedBox(height: 10),
                      Text(message!,
                          textAlign: TextAlign.center, style: messageStyle),
                    ],
                    const SizedBox(height: 18),
                    if (actionsStyle == AlertActionsStyle.doubleText)
                      _DoubleTextActions(
                        leftLabel: secondaryLabel ?? 'Cancel',
                        rightLabel: primaryLabel,
                        leftStyle: actionLeftStyle,
                        rightStyle: actionRightStyle,
                        onLeft:
                            onSecondary ?? () => Navigator.of(context).pop(),
                        onRight: onPrimary,
                      )
                    else
                      _SingleFilledAction(
                        label: primaryLabel,
                        color: accentColor,
                        onPressed: onPrimary,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DoubleTextActions extends StatelessWidget {
  const _DoubleTextActions({
    required this.leftLabel,
    required this.rightLabel,
    required this.leftStyle,
    required this.rightStyle,
    required this.onLeft,
    required this.onRight,
  });

  final String leftLabel;
  final String rightLabel;
  final TextStyle leftStyle;
  final TextStyle rightStyle;
  final VoidCallback onLeft;
  final VoidCallback onRight;

  @override
  Widget build(BuildContext context) {
    final btnBase = TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: const Size(0, 0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              style: btnBase,
              onPressed: onLeft,
              child: Text(leftLabel, style: leftStyle)),
          TextButton(
              style: btnBase,
              onPressed: onRight,
              child: Text(rightLabel, style: rightStyle)),
        ],
      ),
    );
  }
}

class _SingleFilledAction extends StatelessWidget {
  const _SingleFilledAction({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isTeal = color.value == AppPalette.accentTeal.value;

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: color,
          foregroundColor: const Color(0xFFFFFFFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          overlayColor: Colors.transparent,
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return isTeal ? AppPalette.accentTealDark : AppPalette.dangerDark;
            }
            return color;
          }),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

class CustomAlertDialogwithBG {
  static void show({
    required BuildContext context,
    required String title,
    required String primaryLabel,
    required VoidCallback onPrimary,
    String? message,
    String? svgIcon, // <-- শুধু string path পাঠাতে হবে
    String? secondaryLabel,
    VoidCallback? onSecondary,
    AlertActionsStyle actionsStyle = AlertActionsStyle.doubleText,
    Color accentColor = AppPalette.accentTeal,
    double maxWidth = 340,
    Widget? decor,
    Alignment decorAlignment = Alignment.bottomLeft,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: const Color(0x99000000),
      builder: (ctx) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: AlertDialogCard(
            maxWidth: maxWidth,
            svgIcon: svgIcon, // <-- icon এর জায়গায় svgIcon
            decor: decor,
            decorAlignment: decorAlignment,
            title: title,
            message: message,
            primaryLabel: primaryLabel,
            onPrimary: onPrimary,
            secondaryLabel: secondaryLabel,
            onSecondary: onSecondary,
            accentColor: accentColor,
            actionsStyle: actionsStyle,
          ),
        ),
      ),
    );
  }
}
