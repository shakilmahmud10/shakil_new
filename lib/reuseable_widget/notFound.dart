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
      home: NotFound(),
    );
  }
}

/// Home Page with a Button
class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NotFoundPage(
                  svgPath: "assets/images/svg/reusableWidget/notFound1.svg",
                  message: "No Result Found",
                ),
              ),
            );
          },
          child: const Text("Go to Not Found Page"),
        ),
      ),
    );
  }
}

/// Reusable NotFound Widget/Page
class NotFoundPage extends StatelessWidget {
  final String? svgPath;
  final String message;

  const NotFoundPage({
    super.key,
    this.svgPath,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgPath != null)
              SvgPicture.asset(
                svgPath!,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF444444),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
