# 🏠 Homz

> **⚠️ Disclaimer:** This project is currently a Work In Progress (WIP). Features, UI components, and app structure are under active development and subject to change.

A **modern real-estate style Flutter application** featuring a dark theme, reusable UI components, and a chat experience inspired by contemporary messaging apps.

---

# 📸 Screenshots

## 🚀 Onboarding

<p align="center">
  <img src="https://github.com/user-attachments/assets/6951756f-c67d-4c4f-9523-083676a24f5e" height="750"/>
  <img src="https://github.com/user-attachments/assets/60abdf42-015c-4dcc-9dfc-dbd317c336a6" height="750"/>
  <img src="https://github.com/user-attachments/assets/5cb0cd2b-77fa-450f-9d83-727379584c19" height="750"/>
</p>

---

## 🔐 Authentication

### Sign In / Sign Up

<p align="center">
  <img src="https://github.com/user-attachments/assets/78fcef68-dd24-4cea-adcb-239c761215a6" height="750"/>
  <img src="https://github.com/user-attachments/assets/b25f87ea-f31d-4162-b321-43e564e37dd5" height="750"/>

</p>

---

### Password Recovery Flow

<p align="center">
  <img src="https://github.com/user-attachments/assets/c6ab67fe-db40-46b3-b004-24964df68450" height="750"/>
  <img src="https://github.com/user-attachments/assets/4f4193e0-2c9e-4c05-956f-062234cb22f9" height="750"/>
  <img src="https://github.com/user-attachments/assets/a90662d4-8902-4e9b-8662-df6ac13dca15" height ="750"/>
</p>

---

## 💬 Chat Interface

<p align="center">
  <img src="https://github.com/user-attachments/assets/f54e37b8-04a8-4b0f-9f08-5feb1fb6c285" height="750"/>
</p>

---

# ✨ Features

### 🚀 Onboarding Flow

Visually engaging multi-step introductory screens with background imagery.

### 🔐 Authentication

* Login and Registration flows with custom form fields (including country code selectors).
* Complete password recovery pipeline:

  * Forgot Password
  * OTP Verification
  * Reset Password
  * Success Screen
* UI support for third-party OAuth providers (Google, Apple).

### 🎨 Design System

* Centralized dark-themed color palette
* Shared typography styles
* Reusable button and form components

### 💬 Chat Interface

Figma-inspired chat experience featuring:

* Distinct sent and received message bubbles
* Date separator chips
* Attachment-aware input field

---

# ⚙️ Requirements

* **Flutter:** 3.22+ (stable)
* **Dart:** 3.x

---

# 🚀 Getting Started

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

By default, the app runs using the **dark theme defined in**:

```
lib/core/theme/app_theme.dart
```

---

# 📂 Project Structure (High Level)

```
lib/
│
├── core/
│   ├── theme/        # Colors, typography, and global styling
│   ├── widgets/      # Shared reusable UI components
│   └── utilities/    # Helper functions and utilities
│
├── features/
│   ├── authentication/   # Authentication flows and related screens
│   └── chat/             # Chat UI and messaging components
```

---

# 🧠 Development Notes

* Prefer using existing shared widgets (e.g. `CustomTextFormField`, `CustomButton`) before creating new ones.
* Keep colors and typography inside theme files (`app_colors.dart`, text themes) instead of hard-coding values.
* When implementing new UI from Figma, align with existing **design tokens and components** whenever possible.

---
