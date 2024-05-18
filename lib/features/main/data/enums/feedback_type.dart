import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FeedbackType {
  none,
  feedback,
  report,
  suggestion;

  static List<FeedbackType> get validValues => [feedback, report, suggestion];

  Icon get icon => switch (this) {
        none => const Icon(FontAwesomeIcons.a),
        feedback => const Icon(FontAwesomeIcons.inbox),
        report => const Icon(FontAwesomeIcons.bug),
        suggestion => const Icon(FontAwesomeIcons.comments),
      };
}
