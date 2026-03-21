import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';

enum IconSourceType { material, svg, network }

class IconSource {
  final IconSourceType type;
  final IconData? iconData;
  final String? assetPath;
  final String? url;

  const IconSource.material(this.iconData)
    : type = IconSourceType.material,
      assetPath = null,
      url = null;

  const IconSource.svg(this.assetPath)
    : type = IconSourceType.svg,
      iconData = null,
      url = null;

  const IconSource.network(this.url)
    : type = IconSourceType.network,
      iconData = null,
      assetPath = null;
}

enum ProfileButtonType { normal, locale, withoutSuffix, profile }

class ProfileRedirectButton extends StatelessWidget {
  final ProfileButtonType type;
  final String title;
  final IconSource? iconSource;
  final String? languageCode;
  final String? profileImageUrl;
  final VoidCallback? onTap;

  const ProfileRedirectButton._({
    required this.type,
    required this.title,
    this.iconSource,
    this.languageCode,
    this.profileImageUrl,
    this.onTap,
  });

  factory ProfileRedirectButton.normal({
    required IconSource iconSource,
    required String title,
    VoidCallback? onTap,
  }) {
    return ProfileRedirectButton._(
      type: ProfileButtonType.normal,
      iconSource: iconSource,
      title: title,
      onTap: onTap,
    );
  }

  factory ProfileRedirectButton.locale({
    required IconSource iconSource,
    required String title,
    required String languageCode,
    VoidCallback? onTap,
  }) {
    return ProfileRedirectButton._(
      type: ProfileButtonType.locale,
      iconSource: iconSource,
      title: title,
      languageCode: languageCode,
      onTap: onTap,
    );
  }

  factory ProfileRedirectButton.withoutSuffix({
    required IconSource iconSource,
    required String title,
    VoidCallback? onTap,
  }) {
    return ProfileRedirectButton._(
      iconSource: iconSource,
      type: ProfileButtonType.withoutSuffix,
      title: title,
      onTap: onTap,
    );
  }

  factory ProfileRedirectButton.profile({
    required String title,
    //? TODO: Make profileImageUrl required & not nullable when implementing Firebase storage
    String? profileImageUrl,
    VoidCallback? onTap,
  }) {
    return ProfileRedirectButton._(
      type: ProfileButtonType.profile,
      title: title,
      profileImageUrl: profileImageUrl,
      onTap: onTap,
    );
  }

  Widget? _buildIcon(BuildContext context) {
    if (iconSource == null) return null;

    switch (iconSource!.type) {
      case IconSourceType.material:
        return Icon(iconSource!.iconData, size: 24);
      case IconSourceType.svg:
        return SvgPicture.asset(
          iconSource!.assetPath!,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(AppColors.grey[50]!, BlendMode.srcIn),
        );
      case IconSourceType.network:
        return Image.network(
          iconSource!.url!,
          width: 24,
          height: 24,
          errorBuilder: (_, _, _) => const Icon(Icons.error),
        );
    }
  }

  Widget _buildPrefix(BuildContext context) {
    switch (type) {
      case ProfileButtonType.profile:
        return Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 32,
              // backgroundImage: NetworkImage(profileImageUrl!),
            ),
            Expanded(child: Text(title)),
          ],
        );

      default:
        final iconWidget = _buildIcon(context);
        return Row(
          children: [
            if (iconWidget != null) ...[iconWidget, const HorizontalGap(12)],
            Text(title),
          ],
        );
    }
  }

  Widget? _buildSuffix(BuildContext context) {
    switch (type) {
      case ProfileButtonType.withoutSuffix:
        return null;

      case ProfileButtonType.locale:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              languageCode!,
              style: context.bodyMedium.copyWith(color: AppColors.grey[400]),
            ),
            const VerticalGap(8),
            const Icon(Icons.chevron_right, size: 32),
          ],
        );

      default:
        return const Icon(Icons.chevron_right, size: 32);
    }
  }

  @override
  Widget build(BuildContext context) {
    final suffix = _buildSuffix(context);

    return Ink(
      child: InkWell(
        onTap: onTap,
        child: AppDefaultPadding(
          child: Row(
            children: [
              Expanded(child: _buildPrefix(context)),
              if (suffix != null) ...[const SizedBox(width: 12), suffix],
            ],
          ),
        ),
      ),
    );
  }
}
