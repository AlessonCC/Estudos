import 'package:flutter/material.dart';

class CustomColors {
  final Color _activePrimaryButton = const Color.fromARGB(255, 29, 146, 44);
  final Color _activeSecondaryButton = const Color.fromARGB(255, 200, 200, 200);
  final Color _gradientTopColor = const Color.fromARGB(255, 15, 155, 15);
  final Color _gradientBottomColor = Color.fromARGB(255, 235, 255, 235);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondButton() {
    return _activeSecondaryButton;
  }

  Color getGradientTopColor() {
    return _gradientTopColor;
  }

  Color getGradientButtomColor() {
    return _gradientBottomColor;
  }
}
