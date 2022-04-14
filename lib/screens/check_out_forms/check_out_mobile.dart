import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/theme_controller/theme/theme.dart';
import 'package:vms/universal_widgets/my_button.dart';

import '../../universal_widgets/my_navbar.dart';

class CheckOutMobile extends StatelessWidget {
  const CheckOutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneNumber = TextEditingController();

    final _formKey = GlobalKey<FormState>();
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
                              // Navbar
                              MyNavbar(
                                myWidget: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          // Back arrow
                                          IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon:
                                                  const Icon(Icons.arrow_back)),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          // company name
                                          Text(
                                            'Check Out',
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back)),
                        const SizedBox(
                          width: 15,
                        ),
                        // company name
                        Text(
                          'Check Out',
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
            // body
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Check Out Forms',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Search bar and button
                    SizedBox(
                      child: FormBuilder(
                        key: _formKey,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: GoogleFonts.openSans(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Actual field for phone number
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          controller: _phoneNumber,
                                          // controller: _onboardingId,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Eg. 553410176'),
                                          keyboardType: TextInputType.text,
                                          // autovalidateMode: AutovalidateMode.always,
                                          validator:
                                              FormBuilderValidators.compose([
                                            (val) {
                                              if (val == null || val.isEmpty) {
                                                return 'Please enter an onboarding ID';
                                              }
                                              return null;
                                            }
                                          ]),
                                        )),

                                    const SizedBox(
                                      width: 15,
                                    ),
                                    // Submit Button
                                    SizedBox(
                                      width: 100,
                                      child: MyButton(
                                        buttonName: 'Verify',
                                        function: () {
                                          Get.toNamed(
                                              '/checkOutVerificationPage');
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Info and Profile pic and button
                    Container(
                      width: 600,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: primaryClr,
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      ),
                                      title: Text(
                                        'Kwaku Joe Ampah',
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Male',
                                        style: GoogleFonts.openSans(),
                                      ),
                                    ),
                                  ),
                                  // Button to check out
                                  Container(
                                      decoration: BoxDecoration(
                                          color: primaryClr,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton.icon(
                                          onPressed: () {},
                                          label: Text(
                                            'Check Out',
                                            style: GoogleFonts.openSans(
                                                color: Colors.white),
                                          ),
                                          icon: const Icon(Icons.logout,
                                              color: Colors.white),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Gender
                            Text(
                              'Gender',
                              style: GoogleFonts.openSans(),
                            ),
                            Text(
                              'Male',
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Category
                            Text(
                              'Category',
                              style: GoogleFonts.openSans(),
                            ),
                            Text(
                              '9959494eedhdhdt5jfjf8dddh',
                              maxLines: 2,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Category
                            Text(
                              'Purpose',
                              style: GoogleFonts.openSans(),
                            ),
                            Text(
                              'My Phone is Cracked Need to Repair. So I came here to repair it. ',
                              maxLines: 3,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
