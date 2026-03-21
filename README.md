# 🏠 Homz

> **⚠️ Disclaimer:** This project is currently a Work In Progress (WIP). Features, UI components, and app structure are under active development and subject to change.

A **modern real-estate style Flutter application** featuring a dark theme, reusable UI components, and a chat experience inspired by contemporary messaging apps.

---

# 📸 Screenshots

## 🚀 Onboarding

<p align="center">
  <img src="https://github.com/user-attachments/assets/6951756f-c67d-4c4f-9523-083676a24f5e" height="450" style="margin:6px;"/>
  <img src="https://github.com/user-attachments/assets/60abdf42-015c-4dcc-9dfc-dbd317c336a6" height="450" style="margin:6px;"/>
  <img src="https://github.com/user-attachments/assets/5cb0cd2b-77fa-450f-9d83-727379584c19" height="450" style="margin:6px;"/>
</p>

---

## 🔐 Authentication

### Sign In / Sign Up

<p align="center">
  <img src="https://github.com/user-attachments/assets/78fcef68-dd24-4cea-adcb-239c761215a6" height="450" style="margin:6px;"/>
  <img src="https://github.com/user-attachments/assets/b25f87ea-f31d-4162-b321-43e564e37dd5" height="450" style="margin:6px;"/>
</p>

---

### Password Recovery Flow

<p align="center">
  <img src="https://github.com/user-attachments/assets/c6ab67fe-db40-46b3-b004-24964df68450" height="450" style="margin:6px;"/>
  <img src="https://github.com/user-attachments/assets/4f4193e0-2c9e-4c05-956f-062234cb22f9" height="450" style="margin:6px;"/>
  <img src="https://github.com/user-attachments/assets/a90662d4-8902-4e9b-8662-df6ac13dca15" height="450" style="margin:6px;"/>
</p>

---

## 💬 Home Interface

<p align="center">
  <img src="https://github.com/user-attachments/assets/1358a129-5a39-4efb-8ed7-8e33b4e6d3cd" height="450" style="margin:6px;"/>
  <img src="https://github.com/user-attachments/assets/2aacdfd8-0946-4353-846a-57c970db4260" height="450" style="margin:6px;"/>
</p>

---

## Messages & Chat Interfaces

<p align="center">
 <img height="450" alt="Image" src="https://github.com/user-attachments/assets/6db2773b-0e17-4f01-bf32-d7ef7abee854"  />
  <img height="450" alt="Image" src="https://github.com/user-attachments/assets/eeb92df6-ded0-4b9f-a989-8d3222ff23e2" />
 <img height="450" alt="Image" src="https://github.com/user-attachments/assets/4d79c7fa-c1f1-4c6e-8c1b-e91a2f65297b" />

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
* SVG icon set under `assets/icons/`

### 💬 Chat Interface

Figma-inspired chat experience featuring:

* Distinct sent and received message bubbles
* Date separator chips
* Attachment-aware input field

  * When attachments exist, **the hint disappears** and the field becomes **read-only** (typing disabled).

### 🧭 Home Navigation

* Bottom navigation stays pinned using a **single parent `Scaffold`**
* Tab switching uses an animated transition while swapping each tab’s **`AppBar` + `body`** as a single configuration
* Home UI includes dedicated widgets (e.g. `AppBarWidget`, carousel, rent/buy switch, category sections)

### 🏘️ Residential

* Residential “Look” screen with swipeable cards (`LookScreen`)
* Residential details screen with image carousel (`DetailsScreen`)

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
│   ├── chat/             # Chat UI and messaging components
│   ├── home/             # Home navigation + home UI widgets
│   └── residential/      # Residential look + details screens
```

---

# 🧠 Development Notes

* Prefer using existing shared widgets (e.g. `CustomTextFormField`, `CustomButton`) before creating new ones.
* Keep colors and typography inside theme files (`app_colors.dart`, text themes) instead of hard-coding values.
* When implementing new UI from Figma, align with existing **design tokens and components** whenever possible.

---
