import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme_controller/theme/theme.dart';
import '../../universal_widgets/fieldContainer.dart';
import '../../universal_widgets/my_navbar.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller
    final TextEditingController _onBoardingId = TextEditingController();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // circle avatar
                        CircleAvatar(
                          backgroundColor: primaryClr,
                          child: Text(
                            'U',
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        // company name
                        Text(
                          'Union Systems Global',
                          style:
                              GoogleFonts.openSans(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    // Setting button

                    IconButton(
                      onPressed: () {
                        // Setting Popup
                        Get.defaultDialog(
                          radius: 10,
                          title: 'Enter Onboardin ID',
                          titlePadding: EdgeInsets.only(top: 15, bottom: 10),
                          titleStyle: GoogleFonts.openSans(
                            fontSize: 16,
                          ),
                          content: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                //Field

                                SizedBox(
                                  width: 400,
                                  child: FieldContainert(
                                      field: TextFormField(
                                    controller: _onBoardingId,
                                    // controller: _onboardingId,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '####'),
                                    keyboardType: TextInputType.text,
                                    // autovalidateMode: AutovalidateMode.always,
                                    validator: FormBuilderValidators.compose([
                                      (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Please enter an onboarding ID';
                                        }
                                        return null;
                                      }
                                    ]),
                                  )),
                                ),
                              ],
                            ),
                          ),

                          // Butons here
                          cancel: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Close',
                                  style: GoogleFonts.openSans(),
                                ),
                              ),
                            ),
                          ),
                          confirm: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Submit',
                                  style:
                                      GoogleFonts.openSans(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.settings),
                    )
                  ],
                ),
              ),
            ),
            // body

            SizedBox(height: 30),

            // Visitor text
            Text(
              'Visitors',
              style: GoogleFonts.openSans(fontSize: 18),
            ),

            // two boxes
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/checkInFormsPage');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 80),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.login,
                                size: 150,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Check In',
                                style: GoogleFonts.openSans(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/checkOutFormsPage');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 80),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.logout,
                                size: 150,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Check In',
                                style: GoogleFonts.openSans(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // Info below
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome to USG text
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Welcome to ',
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.green)),
                        TextSpan(
                            text: 'Union Sytems Global !',
                            style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.green)),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Branch
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Branch: ',
                            style: GoogleFonts.openSans(
                                fontSize: 14, color: Colors.green)),
                        TextSpan(
                            text: ' Accra Global Branch',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.green)),
                      ]),
                    ),
                    // Event
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Event: ',
                            style: GoogleFonts.openSans(
                                fontSize: 14, color: Colors.green)),
                        TextSpan(
                            text: ' Office visitation',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w600)),
                      ]),
                    ),
                    // Event
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Location: ',
                            style: GoogleFonts.openSans(
                                fontSize: 14, color: Colors.green)),
                        TextSpan(
                            text:
                                ' 215 Laterbikorshie Ponpon Links, Oblogo Rod',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w600)),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
