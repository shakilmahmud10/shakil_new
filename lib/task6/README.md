# Task 6: Book Haven Onboarding System

This task contains a comprehensive onboarding flow system for the Book Haven application, following the unified sequential navigation pattern.

## Structure

### Main Flow Screen
- **BkOnboardingFlowScreen** - Centralized flow controller managing all onboarding pages

### Data Model
- **BkOnboardingData** - Unified data model supporting all page types and configurations
- **BkOnboardingPageData** - Individual page data structure
- **BkFormField** - Reusable form field configuration
- **BkButton** - Button configuration model

### Reusable Components
- **BkPageMessage** - Header and description text component (public)
- **BkCustomButton** - Universal button component with icon support (public)
- **BkSkipButton** - Skip navigation button (public)
- **BkBackButton** - Back navigation button (public)
- **BkFormField** - Form input field with focus management (public)
- **BkPageIndicator** - Page progress indicator (public)
- **BkCustomCheckbox** - Checkbox with custom styling (public)
- **BkBottomLinkText** - Bottom link text component (public)

## Pages Included

1. **Welcome Pages (1-3)** - Introduction screens with page indicators
2. **Account Options (4)** - Login/Create account selection
3. **Login Options (5)** - Email vs Google login options
4. **Login Form (6)** - Email and password input with validation
5. **Signup Form (7)** - Registration form with confirmation fields

## Features

### Navigation
- Sequential page flow with PageView controller
- Skip functionality on appropriate pages
- Back navigation where needed
- Smooth transitions between pages

### UI Components
- Custom InkWell buttons (following user preferences)
- Responsive form fields with focus management
- Consistent styling across all pages
- Overflow prevention through proper layout management

### Form Management
- Unified focus management system
- Dynamic form field generation
- Input validation support
- Remember me and terms acceptance checkboxes

### Status Bar Management
- Transparent status bar
- Auto-hide navigation bar
- Lifecycle-aware status management

## Usage

```dart
import 'package:flutter/material.dart';
import 'task6/bk_onboarding_flow_screen.dart';

// Navigate to the complete onboarding flow
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const BkOnboardingFlowScreen(),
  ),
);
```

## Technical Details

- **Architecture**: Follows unified sequential navigation pattern
- **State Management**: StatefulWidget with proper lifecycle management
- **Styling**: Preserves all existing colors, text styles, and attributes
- **Components**: All reusable components are public classes
- **Overflow Handling**: Proper flex layouts and SingleChildScrollView for forms
- **Memory Management**: Proper disposal of controllers and focus nodes

## Benefits

- **Maintainable**: Single source of truth for all onboarding logic
- **Reusable**: Components can be used across different parts of the app
- **Scalable**: Easy to add new pages or modify existing ones
- **Consistent**: Unified styling and behavior patterns
- **Performance**: Efficient memory usage and proper cleanup

## Screenshots

<img width="402" height="860" alt="image" src="https://github.com/user-attachments/assets/93d74420-ecc9-4659-84bd-4c56f2c5abc5" />
<img width="401" height="870" alt="image" src="https://github.com/user-attachments/assets/01491ad2-53b9-4b9b-9d33-91bfb60bcbfa" />
<img width="411" height="862" alt="image" src="https://github.com/user-attachments/assets/7022b3ae-5c8e-4284-9a7e-fe6983316fae" />
<img width="412" height="867" alt="image" src="https://github.com/user-attachments/assets/9101aa80-fead-4d7a-b89e-6e20699c52e8" />
<img width="414" height="874" alt="image" src="https://github.com/user-attachments/assets/a98ed891-47d4-42bd-839d-1ca0e66981d0" />
<img width="412" height="868" alt="image" src="https://github.com/user-attachments/assets/6a22a41b-e959-4d0f-a29b-8afdd95aad72" />
<img width="406" height="872" alt="image" src="https://github.com/user-attachments/assets/dc7d48c1-3612-418c-b1ab-f9fedd5374db" />
