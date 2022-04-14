import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/theme_controller/theme/theme.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String buttonName;
  VoidCallback function;
  MyButton({Key? key, required this.buttonName, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: primaryClr, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: TextButton(
          onPressed: function,
          child: Text(
            buttonName,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
