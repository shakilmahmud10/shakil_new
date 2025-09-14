import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import '../../Core Components/colors.dart';
import '../../Core Components/images.dart';
import '../onboardingScreen/sw_onboarding1.dart';
import '../sw_onboarding_flow_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim Prayer Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const swSplash2(),
    );
  }
}

class swSplash2 extends StatefulWidget {
  const swSplash2({super.key});
  @override
  _swSplash2State createState() => _swSplash2State();
}

class _swSplash2State extends State<swSplash2> {
  final List<bool> _isActive = [false, false, false, false, false, false];
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();

    // Timer শেষ হলে onboarding এ যাবে
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              // builder: (context) => const SwOnboardingFlowScreen()),
              builder: (context) => const SWonboarding1()),
        );
      });
    });
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        for (int i = 0; i < _isActive.length; i++) {
          _isActive[i] = false;
        }
        _isActive[_currentIndex] = true;
        _currentIndex = (_currentIndex + 1) % _isActive.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: swsplashBGGradient1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            SvgPicture.asset(swSplashIcon),
            const SizedBox(height: 20),
            const Text(
              'Muslim Prayer Time',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'IRD Foundation',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 80, // <-- fix height রাখলাম
                  width: 12,
                  alignment: Alignment.center, // <-- সবসময় center এ থাকবে
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _isActive[index]
                        ? 70
                        : 24, // <-- height শুধু ভিতরেরটা change হচ্ছে
                    width: 8,
                    decoration: BoxDecoration(
                      color: _isActive[index]
                          ? swHeaderTextColor
                          : swDetailsTextColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
