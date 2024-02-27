import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';

import '../extensions/context_extension.dart';
import '../theme/text_theme.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.borderColor,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.hideText = false,
    this.enabled = true,
    this.autoFocus = false,
    this.error = false,
    this.smallSuffixIcon = false,
    this.borderRadius,
    this.maxLines = 1,
    this.hintColor,
    this.width,
    this.height,
    this.label,
    this.fillColor,
    this.hint,
    this.onSubmitted,
    required this.controller,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.contentPadding = AppPadding.def,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.inputFormatters,
  }) : super(key: key);

  final TextInputAction textInputAction;
  final Color? borderColor;
  final double? width;
  final Function(String)? onSubmitted;
  final double? height;
  final String? hint;
  final Color? hintColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool hideText;
  final bool enabled;
  final bool autoFocus;
  final bool smallSuffixIcon;
  final bool error;
  final int maxLines;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Function(String)? onChanged;
  final String? label;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsetsGeometry contentPadding;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> with WidgetsBindingObserver {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addObserver(this);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1.5,
        color: widget.borderColor ?? context.colorScheme.outline,
      ),
    );

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        controller: widget.controller,
        validator: widget.validator,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        onFieldSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
        cursorColor: Theme.of(context).primaryColor,
        obscureText: widget.hideText,
        obscuringCharacter: '#',
        enabled: widget.enabled,
        inputFormatters: (widget.inputFormatters != null)
            ? widget.inputFormatters
            : widget.keyboardType == TextInputType.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        autofocus: widget.autoFocus,
        enableSuggestions: !widget.hideText,
        autocorrect: !widget.hideText,
        autovalidateMode: widget.autovalidateMode,
        onTap: () {
          final lastSelectionPosition = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length - 1),
          );

          final afterLastSelectionPosition = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length),
          );

          if (widget.controller.selection == lastSelectionPosition) {
            widget.controller.selection = afterLastSelectionPosition;
          }
        },
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          // constraints: BoxConstraints(
          //   maxWidth: size.width,
          //   maxHeight: size.width * .5,
          //   minHeight: size.width * .5,
          // ),
          label: widget.label == null ? null : TextWidget(widget.label!),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          filled: true,
          fillColor: widget.fillColor ?? context.colorScheme.surface,
          focusColor: context.colorScheme.primary,
          hintText: widget.hint,
          hintStyle: textTheme.bodyMedium,
          //
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          //
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: widget.smallSuffixIcon ? BoxConstraints(maxWidth: context.width * .15) : null,
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: widget.smallSuffixIcon ? BoxConstraints(maxWidth: context.width * .15) : null,
          // contentPadding: widget.maxLines != 1 ? null : const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
