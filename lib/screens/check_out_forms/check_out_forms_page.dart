import 'package:flutter/material.dart';
import 'package:vms/screens/check_out_forms/check_out_desktop.dart';
import '../../responsiveness/responsive_layout.dart';
import 'check_out_mobile.dart';

class CheckOutFormsPage extends StatelessWidget {
  const CheckOutFormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const CheckOutMobile(),
        desktopBody: const CheckOutDesktop(),
      ),
    );
    ;
  }
}
