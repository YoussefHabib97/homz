## Homz

> **⚠️ Disclaimer:** This project is currently a Work In Progress (WIP). Features, UI components, and app structure are under active development and subject to change.

Modern real-estate style Flutter app with a dark theme, reusable UI components, and a chat experience inspired by contemporary messaging apps.

### Screenshots

| Onboarding | Sign In | Sign Up |
| :---: | :---: | :---: |
| <img src="[https://github.com/user-attachments/assets/fccf2fa3-5759-4f2f-b12d-af7153c4f361](https://github.com/user-attachments/assets/5cb0cd2b-77fa-450f-9d83-727379584c19)" width="450"/> | <img src="https://github.com/user-attachments/assets/78fcef68-dd24-4cea-adcb-239c761215a6" width="450"/> | <img src="https://github.com/user-attachments/assets/b25f87ea-f31d-4162-b321-43e564e37dd5" width="450"/> |

| Forgot Password | Reset Password | Chat Interface |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/c6ab67fe-db40-46b3-b004-24964df68450" width="450"/> | <img src="https://github.com/user-attachments/assets/4f4193e0-2c9e-4c05-956f-062234cb22f9" width="450"/> | <img src="https://github.com/user-attachments/assets/f54e37b8-04a8-4b0f-9f08-5feb1fb6c285" width="450"/> |

### Features

- **Onboarding Flow**: Visually engaging multi-step introductory screens with background imagery.
- **Authentication**: 
  - Login and Registration flows with custom form fields (including country code selectors).
  - Complete password recovery pipeline (Forgot password, OTP verification, Reset password, and Success screens).
  - UI support for third-party OAuth (Google, Apple).
- **Design System**: Centralized dark-themed colors, typography, button, and text field components.
- **Chat Interface**: Figma-inspired chat screen featuring distinct sent/received message bubbles, date separator chips, and an attachment-aware input field.

### Requirements

- **Flutter**: 3.22+ (stable)
- **Dart**: 3.x

### Getting started

- **Install dependencies**

```bash
flutter pub get

```

* **Run the app**

```bash
flutter run

```

By default, it runs with the dark theme defined in `lib/core/theme/app_theme.dart`.

### Project structure (high level)

* `lib/core` – shared theme, widgets, and utilities.
* `lib/features/authentication` – auth-related screens and logic.
* `lib/features/chat` – chat UI and related widgets.

### Development notes

* Prefer using existing shared widgets (e.g., `CustomTextFormField`, `CustomButton`) before creating new ones.
* Keep colors and typography in the theme files (`app_colors.dart`, text themes) instead of hard-coding values in widgets.
* When adding new UI from Figma, align with the existing design tokens and components where possible.
