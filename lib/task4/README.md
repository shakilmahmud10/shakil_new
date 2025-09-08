# Task 4 - Language Selection Onboarding

## Overview
This task implements a language selection screen following the onboarding flow design pattern. The screen allows users to select their preferred language from a list of supported languages.

## Features

### UI Components
- **Header Bar**: Back arrow, title "Select Language", and skip option
- **Image Placeholder**: Centered image container with border styling
- **Language List**: Interactive list with flag emojis and language names
- **Selection State**: Visual feedback for selected language with checkmark
- **Continue Button**: Primary action button to proceed

### Supported Languages
1. 🇺🇸 English (default)
2. 🇧🇩 Bangla
3. 🇸🇦 Arabic
4. 🇵🇰 Urdu
5. 🇮🇳 Hindi

### Design Specifications
- **Background**: Light gray (#F5F5F5)
- **Primary Color**: onBoardingPrimary1 (#1AA483)
- **Typography**: HindSiliguri font family
- **Layout**: Responsive with proper spacing and padding
- **Interactions**: Tap selection with visual feedback

### Status Bar Management
Following the established pattern from task3:
- Transparent status bar background
- Visible status elements (time, battery, signal)
- Auto-hide bottom navigation after 2 seconds
- Lifecycle management for app focus changes

## File Structure
```
lib/task4/
├── onboarding2.dart          # Main language selection screen
└── README.md                 # This documentation
```

## Integration
The screen is integrated into the main navigation:
- Accessible via "Onboarding2 (Task4)" button in main.dart
- Follows the same navigation patterns as other tasks
- Maintains consistency with existing onboarding flows

## Usage
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const LanguageSelectionScreen(),
  ),
);
```

## Implementation Notes
- Maintains all existing functionality patterns from previous tasks
- Uses consistent color scheme and typography
- Implements proper state management for language selection
- Includes gesture handling and system UI management
- Follows the reusable widget patterns established in the project