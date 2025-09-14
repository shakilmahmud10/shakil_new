import 'package:flutter/material.dart';
import 'onboarding_flow_screen.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Flow Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnboardingFlowScreen(),
    );
  }
}

// Example of how to navigate to the new onboarding flow from anywhere in your app:
class SomeOtherScreen extends StatelessWidget {
  const SomeOtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Some Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OnboardingFlowScreen(),
              ),
            );
          },
          child: const Text('Start Onboarding Flow'),
        ),
      ),
    );
  }
}
