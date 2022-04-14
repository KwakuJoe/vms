import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pinput/pinput.dart';
import 'package:vms/theme_controller/theme/theme.dart';
import 'package:vms/universal_widgets/my_button.dart';
import '../../universal_widgets/my_navbar.dart';
import '../check_in_code_verification/widgets/pinput.dart';

class CheckOutVerificationPage extends StatefulWidget {
  const CheckOutVerificationPage({Key? key}) : super(key: key);

  @override
  State<CheckOutVerificationPage> createState() =>
      _CheckOutVerificationPageState();
}

class _CheckOutVerificationPageState extends State<CheckOutVerificationPage> {
  final _formKey = GlobalKey<FormState>();

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
                          'Check Out Verification Code',
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
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                  child: Column(children: [
                    Text(
                      'Enter Previous Code',
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
                              titlePadding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
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
                                    'Bye, see you again, Kwaku Joe Ampah',
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
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // button to clear
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            )),
                        // Resend Code
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pinCodeValue = "";
                              });
                            },
                            child: Text(
                              'Resend code',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: primaryClr),
                            )),
                      ],
                    )
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
