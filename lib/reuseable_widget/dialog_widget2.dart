import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogWidget2 extends StatelessWidget {
  const DialogWidget2({super.key});

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return CustomAlertDialog(
          mainIcon: Icons.car_crash,
          mainIconBgColor: AppColors.danger,
          title: 'Are you sure?',
          subtitle: 'Are You Sure you want to Delete Plan\n“Plan Name 1”',
          button1Text: 'Cancel',
          button2Text: 'Delete',
          onButton1Pressed: () => Navigator.of(context).pop(),
          onButton2Pressed: () {
// your delete logic
            Navigator.of(context).pop();
          },
          dialogBoxCorner: 28,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Preview')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.open_in_new_rounded),
          label: const Text('Open Custom Alert'),
          onPressed: () => openDialog(context),
        ),
      ),
    );
  }
}

class AppColors {
  static const Color dialog = Colors.white;
  static const Color title = Color(0xFF111827);
  static const Color subtitle = Color(0xFF6B7280);
  static const Color danger = Color(0xFFFF3B30);
  static const Color blotch = Color(0xFFFFEFEF);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: AppColors.title,
    height: 1.3,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitle,
    height: 1.6,
  );

  static const TextStyle buttonNeutral = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle buttonDanger = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.danger,
  );
}

const String _svgIcon1 =
    "assets/images/svg/reusableWidget/topCross_notepad.svg";
const String _svgBG = "assets/images/svg/reusableWidget/bgSplash1.svg";

class CustomAlertDialog extends StatelessWidget {
  final IconData mainIcon;
  final Color mainIconBgColor;
  final String title;
  final String subtitle;
  final String button1Text;
  final String button2Text;
  final VoidCallback onButton1Pressed;
  final VoidCallback onButton2Pressed;
  final double dialogBoxCorner;

  const CustomAlertDialog({
    super.key,
    required this.mainIcon,
    required this.mainIconBgColor,
    required this.title,
    required this.subtitle,
    required this.button1Text,
    required this.button2Text,
    required this.onButton1Pressed,
    required this.onButton2Pressed,
    this.dialogBoxCorner = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.dialog,
          borderRadius: BorderRadius.circular(dialogBoxCorner),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(26, 0, 0, 0),
              blurRadius: 24,
              offset: Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _IconSplash(
                svgIcon: _svgIcon1,
                svgIconBG: _svgBG,
              ),
              const SizedBox(height: 12),
              Text(title,
                  style: AppTextStyles.title, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Text(subtitle,
                  style: AppTextStyles.subtitle, textAlign: TextAlign.center),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: onButton1Pressed,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      foregroundColor: Colors.black87,
                    ),
                    child:
                        Text(button1Text, style: AppTextStyles.buttonNeutral),
                  ),
                  TextButton(
                    onPressed: onButton2Pressed,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      foregroundColor: AppColors.danger,
                    ),
                    child: Text(button2Text, style: AppTextStyles.buttonDanger),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconSplash extends StatelessWidget {
  final String svgIcon;
  final String? svgIconBG;

  const _IconSplash({
    required this.svgIcon,
    this.svgIconBG,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (svgIconBG != null) SvgPicture.asset(svgIconBG!),
          SvgPicture.asset(svgIcon)
        ],
      ),
    );
  }
}
