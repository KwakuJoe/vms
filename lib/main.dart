import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms/screens/setup/setup_screen.dart';
import 'screens/check_in_code_verification/check_in_code_verifcation_page.dart';
import 'screens/check_in_forms/check_in_forms_page.dart';
import 'screens/check_out_code_verifcation/check_out_verfication_page.dart';
import 'screens/check_out_forms/check_out_forms_page.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login.dart';
import 'theme_controller/theme/theme.dart';
// import 'theme_controller/theme_servie/theme_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme represent light mode
      theme: ThemeData(
        backgroundColor: lightBackgroundColor,
        primaryColor: primaryClr,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      // // theme mode represent dark theme
      // darkTheme: Themes.darkTheme,
      // // themeMode represent the current or active theme
      // themeMode: ThemeService().theme,
      home: const Login(),

      getPages: [
        GetPage(
            name: '/setupScreen',
            page: () => const SetupScreen(),
            transition: Transition.downToUp),
        GetPage(
            name: '/homeScreen',
            page: () => const HomeScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/checkInFormsPage',
            page: () => const CheckInFormsPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/checkInCodeVerificationPage',
            page: () => const CheckInCodeVerificationPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/checkOutFormsPage',
            page: () => const CheckOutFormsPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/checkOutVerificationPage',
            page: () => const CheckOutVerificationPage(),
            transition: Transition.rightToLeft),
      ],
    );
  }
}

// 