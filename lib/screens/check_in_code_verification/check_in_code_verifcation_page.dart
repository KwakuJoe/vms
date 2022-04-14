import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pinput/pinput.dart';
import 'package:vms/theme_controller/theme/theme.dart';
import 'package:vms/universal_widgets/my_button.dart';
import '../../universal_widgets/my_navbar.dart';
import 'widgets/pinput.dart';

class CheckInCodeVerificationPage extends StatefulWidget {
  const CheckInCodeVerificationPage({Key? key}) : super(key: key);

  @override
  State<CheckInCodeVerificationPage> createState() =>
      _CheckInCodeVerificationPageState();
}

class _CheckInCodeVerificationPageState
    extends State<CheckInCodeVerificationPage> {
  final _formKey = GlobalKey<FormState>();

  // Branch options
  var categoryOptions = ['Customer Compliance', 'Customer product check'];
  var genderOptions = ['Male', 'Femal'];

  @override
  Widget build(BuildContext context) {
    // controllers
    // Verification code controller
    String pinCodeValue = "";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navbar
            MyNavbar(
              myWidget: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: [
                    Row(
                      children: [
                        // Back arrow
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back)),
                        const SizedBox(
                          width: 15,
                        ),
                        // company name
                        Text(
                          'Check In Verification Code',
                          style:
                              GoogleFonts.openSans(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Body

            FormBuilder(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  child: Column(children: [
                    Text(
                      'Enter Verification Code',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Pinput Field
                    Pinput(
                        defaultPinTheme: PinputTheme().defaultPinTheme,
                        focusedPinTheme: PinputTheme().focusedPinTheme,
                        submittedPinTheme: PinputTheme().focusedPinTheme,
                        // validator: (s) {
                        //   // return s == '2222' ? null : 'Pin is incorrect';
                        // },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onChanged: (pin) {
                          //  print(pin);
                        },
                        onCompleted: (pin) {
                          // print(pin);
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    // Submit Button
                    SizedBox(
                      width: 250,
                      child: MyButton(
                          buttonName: 'Submit',
                          function: () {
                            // Snack Bar
                            Get.defaultDialog(
                                radius: 10,
                                title: '',
                                titlePadding: const EdgeInsets.only(top: 15),
                                barrierDismissible: false,
                                titleStyle: GoogleFonts.openSans(
                                    fontSize: 16, color: Colors.green),
                                content: Column(
                                  children: [
                                    // Icon check
                                    const Icon(Icons.check_circle_outline,
                                        size: 80, color: Colors.green),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // welcome name
                                    Text(
                                      'Welcome Kwaku Joe',
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // loading
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: LoadingIndicator(
                                        indicatorType:
                                            Indicator.ballClipRotateMultiple,
                                        colors:
                                            PinputTheme().kDefaultRainbowColors,
                                        strokeWidth: 4.0,
                                      ),
                                    ),

                                    // complete button
                                    SizedBox(
                                      width: 200,
                                      child: MyButton(
                                          buttonName: 'Complete',
                                          function: () {
                                            Get.offAllNamed('/homeScreen');
                                          }),
                                    )
                                  ],
                                ));
                            // Next to verification
                            Get.toNamed('/checkInCodeVerificationPage');
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // button to clear
                    TextButton(
                        onPressed: () {
                          setState(() {
                            pinCodeValue = "";
                          });
                        },
                        child: Text(
                          'Clear code',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: primaryClr),
                        ))
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
