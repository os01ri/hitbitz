import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    this.controller,
    this.prefixIcon,
    this.enabled = true,
    this.validator,
  });

  final String label;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFieldWidget(
        prefixIcon: prefixIcon?.paddingAll(12),
        contentPadding: const EdgeInsets.all(18),
        controller: controller ?? TextEditingController(),
        enabled: enabled,
        label: label,
        validator: validator,
      ),
    );
  }
}
