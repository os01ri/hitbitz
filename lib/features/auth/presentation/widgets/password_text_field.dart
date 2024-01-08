import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.showPasswordListenable,
    this.label = "Password",
  });

  final String label;
  final ValueNotifier<bool> showPasswordListenable;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ValueListenableBuilder<bool>(
        valueListenable: showPasswordListenable,
        builder: (context, show, child) => TextFieldWidget(
          prefixIcon: const FaIcon(FontAwesomeIcons.unlockKeyhole).paddingAll(12),
          contentPadding: const EdgeInsets.all(18),
          controller: TextEditingController(),
          label: label,
          suffixIcon: IconButton(
            onPressed: () => showPasswordListenable.value = !show,
            icon: show
                ? FaIcon(FontAwesomeIcons.eyeSlash, color: context.colorScheme.onSurface)
                : FaIcon(FontAwesomeIcons.eye, color: context.colorScheme.primary),
          ).paddingHorizontal(5),
        ),
      ),
    );
  }
}
