import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DialogWidget3(),
    );
  }
}

class DialogWidget3 extends StatelessWidget {
  const DialogWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3A3A3A),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return CustomDialog2(
                  svgIcon:
                      "assets/images/svg/reusableWidget/deleteNotepad1.svg",
                  title: "Are you sure?",
                  subtitle:
                      "You will not be able to recover this imaginary file!",
                  button1Text: "Cancel",
                  button2Text: "Clear All",
                  onButton1Pressed: () => Navigator.pop(context),
                  onButton2Pressed: () {
                    Navigator.pop(context);
                    // your clear all logic
                  },
                );
              },
            );
          },
          child: const Text("Show CustomDialog2"),
        ),
      ),
    );
  }
}

/// --- CustomDialog2 Reusable Widget ---
class CustomDialog2 extends StatelessWidget {
  final String? svgIcon;
  final String title;
  final String subtitle;
  final String button1Text;
  final String button2Text;
  final VoidCallback onButton1Pressed;
  final VoidCallback onButton2Pressed;

  const CustomDialog2({
    super.key,
    this.svgIcon,
    required this.title,
    required this.subtitle,
    required this.button1Text,
    required this.button2Text,
    required this.onButton1Pressed,
    required this.onButton2Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: const Color(0xFFFFFBF7), // creamy white
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (svgIcon != null)
              SvgPicture.asset(
                svgIcon!,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            const SizedBox(height: 24),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111111),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Subtitle
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color(0xFF222222),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Buttons Row
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFE9E1D7),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onButton1Pressed,
                    child: Text(
                      button1Text,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4B3E2C),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onButton2Pressed,
                    child: Text(
                      button2Text,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
