import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/shared/layout/default_app_padding.dart';
import 'package:homz/core/theme/app_colors.dart';

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

enum ActionTileType { normal, locale, withoutSuffix, profile, searchResult }

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

  factory ActionTile.search({
    required String title,
    VoidCallback? onTap,
    VoidCallback? onSuffixTap,
  }) {
    return ActionTile._(
      type: ActionTileType.searchResult,
      title: title,
      onTap: onTap,
      onSuffixTap: onSuffixTap,
    );
  }

  /// Builds the prefix widget: icon or avatar
  Widget? _buildPrefix(BuildContext context) {
    switch (type) {
      case ActionTileType.profile:
        return CircleAvatar(
          radius: 32,
          // backgroundImage: NetworkImage(profileImageUrl!),
        );
      default:
        if (iconSource == null) return null;
        switch (iconSource!.type) {
          case IconSourceType.material:
            return Icon(iconSource!.iconData, size: 24);
          case IconSourceType.svg:
            return SvgPicture.asset(
              iconSource!.assetPath!,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.grey[50]!,
                BlendMode.srcIn,
              ),
            );
          case IconSourceType.network:
            return Image.network(
              iconSource!.url!,
              width: 24,
              height: 24,
              errorBuilder: (_, _, _) => const Icon(Icons.error),
            );
          default:
            return null;
        }
    }
  }

  /// Builds the suffix widget (right side)
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
            const Gap(8),
            const Icon(Icons.chevron_right, size: 32),
          ],
        );
      case ActionTileType.searchResult:
        return SvgPicture.asset(
          kIconCross,
          colorFilter: ColorFilter.mode(AppColors.grey[50]!, BlendMode.srcIn),
        );
      default:
        return const Icon(Icons.chevron_right, size: 32);
    }
  }

  @override
  Widget build(BuildContext context) {
    final prefix = _buildPrefix(context);
    final suffix = _buildSuffix(context);

    final children = <Widget>[];

    // Prefix (leading)
    if (prefix != null) {
      children.add(prefix);
      children.add(const Gap(12));
    }

    // Title (always expands)
    children.add(Expanded(child: Text(title)));

    // Suffix (trailing)
    if (suffix != null) {
      children.add(const SizedBox(width: 12));
      children.add(
        Ink(
          child: InkWell(
            onTap: onSuffixTap,
            borderRadius: BorderRadius.circular(32),
            child: Padding(padding: const EdgeInsets.all(8), child: suffix),
          ),
        ),
      );
    }

    return Ink(
      child: InkWell(
        onTap: onTap,
        child: DefaultPadding(child: Row(children: children)),
      ),
    );
  }
}
