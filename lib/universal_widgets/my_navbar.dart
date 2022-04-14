// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyNavbar extends StatelessWidget {
  Widget myWidget;
  MyNavbar({Key? key, required this.myWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
      child: myWidget,
    );
  }
}
