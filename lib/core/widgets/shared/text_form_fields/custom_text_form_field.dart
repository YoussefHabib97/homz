import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/theme/chat_text_theme.dart';
import 'package:homz/core/widgets/models/field_config_model.dart';
import 'package:homz/core/widgets/shared/text_form_fields/base_text_form_field.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? passwordToMatchController;
  final FieldType fieldType;
  final VoidCallback? onFilterTap;
  final VoidCallback? onAttach;
  final VoidCallback? onSend;
  final List<Widget> attachments;
  const CustomTextFormField._({
    required this.controller,
    required this.fieldType,
    this.passwordToMatchController,
    this.onFilterTap,
    this.onAttach,
    this.onSend,
    this.attachments = const [],
  });

  // Factories
  factory CustomTextFormField.name({
    required TextEditingController controller,
  }) =>
      CustomTextFormField._(controller: controller, fieldType: FieldType.name);

  factory CustomTextFormField.password({
    required TextEditingController controller,
  }) => CustomTextFormField._(
    controller: controller,
    fieldType: FieldType.password,
  );

  factory CustomTextFormField.confirmPassword({
    required TextEditingController controller,
    required TextEditingController passwordToMatch,
  }) => CustomTextFormField._(
    controller: controller,
    fieldType: FieldType.confirmPassword,
    passwordToMatchController: passwordToMatch,
  );

  factory CustomTextFormField.phone({
    required TextEditingController controller,
  }) =>
      CustomTextFormField._(controller: controller, fieldType: FieldType.phone);

  factory CustomTextFormField.search({
    required TextEditingController controller,
    VoidCallback? onFilterTap,
  }) => CustomTextFormField._(
    controller: controller,
    fieldType: FieldType.search,
    onFilterTap: onFilterTap,
  );

  factory CustomTextFormField.chat({
    required TextEditingController controller,
    VoidCallback? onAttach,
    VoidCallback? onSend,
    List<Widget> attachments = const [],
  }) => CustomTextFormField._(
    controller: controller,
    fieldType: FieldType.chat,
    onAttach: onAttach,
    onSend: onSend,
    attachments: attachments,
  );

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final FocusNode _focusNode;
  late final ValueNotifier<bool> _obscureNotifier;
  final ValueNotifier<String?> _errorNotifier = ValueNotifier(null);
  late final FieldConfig _config;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _config = FieldConfig.get(
      widget.fieldType,
      passwordToMatch: widget.passwordToMatchController,
    );

    _obscureNotifier = ValueNotifier(
      widget.fieldType == FieldType.password ||
          widget.fieldType == FieldType.confirmPassword,
    );

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _config.validator != null) {
        _errorNotifier.value = _config.validator!(widget.controller.text);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _obscureNotifier.dispose();
    _errorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isChatField = widget.fieldType == FieldType.chat;
    final hasChatAttachments = isChatField && widget.attachments.isNotEmpty;

    return ListenableBuilder(
      listenable: Listenable.merge([_obscureNotifier, _errorNotifier]),
      builder: (context, _) {
        return BaseTextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          readOnly: hasChatAttachments,
          obscureText: _obscureNotifier.value,
          keyboardType: _config.keyboardType,
          validator: _config.validator,
          decoration: InputDecoration(
            hintText: hasChatAttachments ? null : _config.hint,
            filled: isChatField,
            fillColor: isChatField ? AppExtraColors.chatTextFieldColor : null,
            hintStyle: isChatField
                ? ChatTextStyles.input.copyWith(color: AppColors.grey[400])
                : null,
            contentPadding: isChatField
                ? const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
                : null,
            enabledBorder: isChatField
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(999),
                    borderSide: BorderSide.none,
                  )
                : null,
            focusedBorder: isChatField
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(999),
                    borderSide: BorderSide(
                      color: AppColors.primary[300]!,
                      width: 1.5,
                    ),
                  )
                : null,
            errorText: _errorNotifier.value,
            prefixIcon: hasChatAttachments
                ? _buildChatAttachmentsPrefix()
                : _buildSurgicalPrefix(),
            prefixIconConstraints: isChatField
                ? const BoxConstraints(minWidth: 0, minHeight: 0)
                : null,
            suffixIcon: _buildSurgicalSuffix(),
          ),
        );
      },
    );
  }

  Widget? _buildChatAttachmentsPrefix() {
    if (widget.attachments.isEmpty) return null;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.attachments
            .map(
              (thumb) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(width: 40, height: 40, child: thumb),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget? _buildSurgicalPrefix() {
    if (widget.fieldType == FieldType.phone) return _buildPhonePrefix();
    if (_config.prefix == null) return null;

    return ListenableBuilder(
      listenable: Listenable.merge([_focusNode, widget.controller]),
      builder: (context, child) {
        final color = _resolveColor(
          widget.controller.text.isNotEmpty,
          _focusNode.hasFocus,
        );
        return ColorFiltered(
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          child: child,
        );
      },
      child: _config.prefix,
    );
  }

  Widget? _buildSurgicalSuffix() {
    if (widget.fieldType == FieldType.password ||
        widget.fieldType == FieldType.confirmPassword) {
      return ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          if (widget.controller.text.isEmpty) return const SizedBox.shrink();
          return IconButton(
            onPressed: () => _obscureNotifier.value = !_obscureNotifier.value,
            icon: SvgPicture.asset(
              _obscureNotifier.value ? kIconEye : kIconEyeSlash,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                AppColors.grey[50]!,
                BlendMode.srcATop,
              ),
            ),
          );
        },
      );
    } else if (widget.fieldType == FieldType.search) {
      return ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          if (widget.controller.text.isEmpty) return SizedBox.shrink();
          return IconButton(
            icon: SvgPicture.asset(
              kIconSearch,
              colorFilter: ColorFilter.mode(
                AppColors.grey[50]!,
                BlendMode.srcATop,
              ),
            ),
            onPressed: widget.onFilterTap,
          );
        },
      );
    } else if (widget.fieldType == FieldType.chat) {
      return Padding(
        padding: const EdgeInsets.only(right: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                height: 24,
                kIconAttachFile,
                colorFilter: ColorFilter.mode(
                  AppColors.grey[50]!,
                  BlendMode.srcATop,
                ),
              ),
              onPressed: widget.onAttach,
            ),
            IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primary[300]),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              icon: SvgPicture.asset(
                height: 24,
                kIconSend,
                colorFilter: ColorFilter.mode(
                  AppColors.grey[50]!,
                  BlendMode.srcATop,
                ),
              ),
              onPressed: widget.onSend,
            ),
          ],
        ),
      );
    }

    return null;
  }

  Widget _buildPhonePrefix() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [Center(child: Text("Country Picker Form Placeholder"))],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("🇪🇬"),
            SizedBox(width: 8),
            Text("+20"),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }

  Color _resolveColor(bool hasText, bool isFocused) {
    if (isFocused) return AppColors.grey[50]!;
    if (hasText) return AppColors.grey[200]!;
    return AppColors.grey[400]!;
  }
}
