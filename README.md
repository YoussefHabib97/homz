## homz

Modern real-estate style Flutter app with a dark theme, reusable UI components, and a chat experience inspired by contemporary messaging apps.

### Features

- **Authentication**: Password flows and custom form fields.
- **Design system**: Centralized colors, typography, button and text field components.
- **Chat**: Figma-inspired chat screen with message bubbles, avatars, date chips, and attachment-aware input.

### Requirements

- **Flutter**: 3.22+ (stable)
- **Dart**: 3.x

### Getting started

- **Install dependencies**

```bash
flutter pub get
```

- **Run the app**

```bash
flutter run
```

By default it runs with the dark theme defined in `lib/core/theme/app_theme.dart`.

### Project structure (high level)

- `lib/core` – shared theme, widgets, and utilities.
- `lib/features/authentication` – auth-related screens and logic.
- `lib/features/chat` – chat UI and related widgets.

### Development notes

- Prefer using existing shared widgets (e.g. `CustomTextFormField`, `CustomButton`) before creating new ones.
- Keep colors and typography in the theme files (`app_colors.dart`, text themes) instead of hard-coding values in widgets.
- When adding new UI from Figma, align with the existing design tokens and components where possible.
