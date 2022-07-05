import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 29, 146, 44);
  Color _activeSecondaryButton = Color.fromARGB(255, 200, 200, 200);
  Color _topColor = const Color.fromARGB(255, 15, 155, 15);
  Color _bottomColor = const Color.fromARGB(255, 255, 255, 255);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondButton() {
    return _activeSecondaryButton;
  }

  Color getTopColor() {
    return _topColor;
  }

  Color getButtomColor() {
    return _bottomColor;
  }
}
