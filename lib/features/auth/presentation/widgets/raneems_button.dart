import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';

class RaneemsButton extends StatelessWidget {
  const RaneemsButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        color: color,
        textColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 4.0,
        child: TextWidget(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
