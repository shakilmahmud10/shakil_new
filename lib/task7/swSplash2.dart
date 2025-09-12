import 'package:flutter/material.dart';
import 'dart:async';

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
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const sw_onboarding1()),
        );
      });
    });
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
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
          gradient: LinearGradient(
            colors: [Color(0xFF0A1931), Color(0xFF183B56)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Icon(Icons.mosque, size: 100, color: Colors.white70),
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

            // Fixed height দিয়েছি, তাই আর up/down করবে না
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 30, // Fixed height
                  width: _isActive[index] ? 12 : 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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

// Onboarding screen
class sw_onboarding1 extends StatelessWidget {
  const sw_onboarding1({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This is the Onboarding Screen',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
