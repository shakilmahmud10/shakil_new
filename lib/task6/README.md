# Task 6 - Book Haven Onboarding

This task implements the Book Haven onboarding flow, following the established patterns from task5 but with Book Haven specific branding and colors.

## Folder Structure

```
task6/
├── onboarding/
│   └── BkOnboardingPage1.dart
└── README.md
```

## Features

### BkOnboardingPage1.dart
- **Title**: "Welcome to the Book Haven!"
- **Subtitle**: "Dive into a world of stories. Find your favorite genres and authors with ease."
- **Visual**: Uses `bkOnboarding1` SVG asset (books illustration)
- **Colors**: Book Haven specific color palette with sage green theme
- **Layout**: Follows QM onboarding pattern with 6:3:2 flex distribution
- **Navigation**: Circular arrow button for continuation
- **Page Indicator**: Dots showing current position (page 1 of 3)

## Design System

### Colors Used
- Background: `bkBackgroundColor` (#F8F7F5)
- Primary Green: `bkPrimaryGreen` (#8FB776)
- Active Indicator: `bkActiveIndicator` (#8FB776)
- Inactive Indicator: `bkInactiveIndicator` (#D0D0D0)
- Header Text: `bkHeaderTextColor` (#212529)
- Details Text: `bkDetailsTextColor` (#64676A)

### Typography
- Header: `bkHeaderTextStlye` (22px, Semi-bold, Inter font)
- Details: `bkDetailsTextStyle` (14px, Regular, Inter font)

## Implementation Notes

- Follows semantic accessibility best practices
- Responsive design with proper flex layouts
- System UI management with auto-hide navigation bars
- Material design principles with proper touch targets
- Consistent with existing QM onboarding patterns
- Ready for expansion to additional onboarding pages

## Next Steps

This page is designed to be part of a larger onboarding flow. Additional pages (BkOnboardingPage2, BkOnboardingPage3, etc.) can be created following the same pattern and eventually combined into a unified flow screen similar to task5's implementation.