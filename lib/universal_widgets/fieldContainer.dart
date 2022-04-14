import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldContainert extends StatelessWidget {
  Widget field;
  FieldContainert({Key? key, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: field,
      ),
    );
  }
}
