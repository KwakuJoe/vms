import 'package:flutter/material.dart';
import 'package:vms/screens/home/home_screen_mobile.dart';

import '../../responsiveness/responsive_layout.dart';
import 'home_screen_desktop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const HomeScreenMobile(),
        desktopBody: const HomeScreenDesktop(),
      ),
    );
  }
}
