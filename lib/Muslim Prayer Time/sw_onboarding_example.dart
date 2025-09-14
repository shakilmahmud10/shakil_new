import 'package:flutter/material.dart';
import 'sw_onboarding_flow_screen.dart';

// Example of how to use the new unified SW Onboarding Flow
class SwOnboardingExample extends StatelessWidget {
  const SwOnboardingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SW Onboarding Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SwOnboardingFlowScreen(),
              ),
            );
          },
          child: const Text('Start SW Onboarding Flow'),
        ),
      ),
    );
  }
}

// This demonstrates how the unified flow works:
// 
// 1. PageView with 3 pages (Location, Madhab, Notification)
// 2. Page indicators that stay in position but change state per page index
// 3. Button clicks navigate to the next page (no scrolling allowed)
// 4. All previously private classes (_Indicator, _PageIndicator, etc.) are now public
// 5. Each page has its own specialized content while sharing the same overall structure
// 
// Key Features:
// - **Page Navigation**: Uses PageController with disabled scroll physics
// - **Indicators**: Fixed position with animated active state changes
// - **Reusable Components**: All widgets are now public and reusable
// - **State Management**: Proper state management for selection (Madhab, notifications)
// - **Consistent Styling**: Uses the same gradient background and styling throughout
// 
// Usage in main.dart:
// ```dart
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => const SwOnboardingFlowScreen(),
//   ),
// );
// ```