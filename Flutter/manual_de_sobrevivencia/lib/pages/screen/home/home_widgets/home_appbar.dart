import 'package:flutter/material.dart';
import 'package:manual_de_sobrevivencia/shared/constants/custom_colors.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: const Text("Disciplinas"),
    centerTitle: true,
    backgroundColor: CustomColors().getGradientTopColor(),
  );
}
