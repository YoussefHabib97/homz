## Changelog

### Unreleased (since `v0.1.1-alpha`)

- **Home**
  - Added new Home UI module under `lib/features/home/ui/` including reusable widgets:
    - App bar widget, rent/buy switch, carousel slider, navigation buttons, and category sections (commercial/residential/shops).
  - Added favorite icon support and notification assets.
  - Updated Home bottom navigation behavior and tab switching patterns.

- **Residential**
  - Added Residential browsing experience:
    - `LookScreen` with swipeable card/page-view UI.
    - `DetailsScreen` with an image carousel and details layout.

- **Design system / UI components**
  - Refactored `CustomButton` and introduced `ButtonConfig` (`lib/core/widgets/models/button_config_model.dart`).
  - Added `RoundedButton`.
  - Enhanced `CustomTextFormField.chat`:
    - Inline attachments rendering.
    - Hint hides and typing becomes read-only when attachments exist.

- **Routing & app wiring**
  - Router updates in `lib/core/utils/app_router.dart` and app integration updates in `lib/app.dart`.

- **Assets**
  - Added multiple SVG icons in `assets/icons/` and new demo images in `assets/images/`.

### 0.1.1

- **Chat UI**
  - Implemented Figma-inspired chat screen with:
    - Dark background, header with back button and avatar.
    - Incoming/outgoing message bubbles with timestamps.
    - Centered “Today” date chip.
  - Added attachment-aware chat input:
    - Pill-shaped text field with primary-colored send control.
    - Inline attachment thumbnails that replace the hint and disable typing when present.

### 0.1.0

- Initial project scaffold created by Flutter.
- Basic theming and shared widgets set up (`AppTheme`, `AppColors`, `CustomTextFormField`, `CustomButton`).
