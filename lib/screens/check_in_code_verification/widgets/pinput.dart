import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../theme_controller/theme/theme.dart';

class PinputTheme {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    ),
  );

  //focused theme
  final focusedPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
          border: Border.all(color: primaryClr),
          borderRadius: BorderRadius.circular(8)));

  // submitted theme
  final submittedPinTheme = const PinTheme(
    width: 56,
    height: 56,
    decoration: BoxDecoration(
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );

  final List<Color> kDefaultRainbowColors = const [
    Colors.blue,
    Colors.blueAccent,
    Colors.blueGrey,
  ];
}
