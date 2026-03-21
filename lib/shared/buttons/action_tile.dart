import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';

enum IconSourceType { material, svg, network }

class IconSource {
  final IconSourceType? type;
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

enum ActionTileType { normal, locale, withoutSuffix, profile, search }

class ActionTile extends StatelessWidget {
  final ActionTileType type;
  final String title;
  final IconSource? iconSource;
  final String? languageCode;
  final String? profileImageUrl;
  final VoidCallback? onTap, onSuffixTap;

  const ActionTile._({
    required this.type,
    required this.title,
    this.iconSource,
    this.languageCode,
    this.profileImageUrl,
    this.onTap,
    this.onSuffixTap,
  });

  factory ActionTile.normal({
    required IconSource iconSource,
    required String title,
    VoidCallback? onTap,
  }) {
    return ActionTile._(
      type: ActionTileType.normal,
      iconSource: iconSource,
      title: title,
      onTap: onTap,
    );
  }

  factory ActionTile.locale({
    required IconSource iconSource,
    required String title,
    required String languageCode,
    VoidCallback? onTap,
  }) {
    return ActionTile._(
      type: ActionTileType.locale,
      iconSource: iconSource,
      title: title,
      languageCode: languageCode,
      onTap: onTap,
    );
  }

  factory ActionTile.withoutSuffix({
    required IconSource iconSource,
    required String title,
    VoidCallback? onTap,
  }) {
    return ActionTile._(
      iconSource: iconSource,
      type: ActionTileType.withoutSuffix,
      title: title,
      onTap: onTap,
    );
  }

  factory ActionTile.profile({
    required String title,
    // TODO: Make profileImageUrl required & not nullable when implementing Firebase storage
    String? profileImageUrl,
    VoidCallback? onTap,
    VoidCallback? onSuffixTap,
  }) {
    return ActionTile._(
      type: ActionTileType.profile,
      title: title,
      profileImageUrl: profileImageUrl,
      onTap: onTap,
      onSuffixTap: onSuffixTap,
    );
  }

  factory ActionTile.search({required String title, VoidCallback? onTap}) {
    return ActionTile._(
      type: ActionTileType.search,
      title: title,
      onTap: onTap,
    );
  }

  Widget? _buildIcon(BuildContext context) {
    if (iconSource == null) return null;

    switch (iconSource!.type) {
      case IconSourceType.material!:
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
      case ActionTileType.profile:
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
      case ActionTileType.withoutSuffix:
        return null;

      case ActionTileType.locale:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              languageCode!,
              style: context.bodyMedium.copyWith(color: AppColors.grey[400]),
            ),
            HorizontalGap(8),
            const Icon(Icons.chevron_right, size: 32),
          ],
        );
      case ActionTileType.search:
        return IconButton(
          icon: SvgPicture.asset(
            kIconCross,
            colorFilter: ColorFilter.mode(AppColors.grey[50]!, BlendMode.srcIn),
          ),
          onPressed: onSuffixTap,
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
