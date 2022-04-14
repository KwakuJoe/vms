import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/theme_controller/theme/theme.dart';
import 'package:vms/universal_widgets/fieldContainer.dart';
import 'package:vms/universal_widgets/my_button.dart';

import '../../universal_widgets/my_navbar.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  // Branch options
  var branchOptions = ['Accra branch', 'Kumasi branch'];
  var eventOptions = ['Event1', 'Event2'];

  @override
  Widget build(BuildContext context) {
    // controllers
    final TextEditingController _phoneNumber = TextEditingController();
    const String _branch = "";
    const String _events = "";

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
                width: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text - Application steups
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Application Setup',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold),
                          ),
                          // reset Button
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 14,
                                  child: Icon(
                                    Icons.restore,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Reset App',
                                  style: GoogleFonts.openSans(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Forms Begin here

                      // country
                      Text(
                        'Country',
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          // +233
                          SizedBox(
                            width: 70,
                            child: FieldContainert(
                                field: TextFormField(
                              decoration: InputDecoration(
                                enabled: false,
                                hintText: '+233',
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                            )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // Actual field for phone number
                          Expanded(
                            child: Container(
                              child: FieldContainert(
                                  field: TextFormField(
                                controller: _phoneNumber,
                                // controller: _onboardingId,
                                decoration: const InputDecoration(
                                    enabled: false,
                                    border: InputBorder.none,
                                    hintText: 'Ghana'),
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
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // Select Branch
                      Text(
                        'Select branch',
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FieldContainert(
                          field: FormBuilderDropdown(
                            name: 'branch',
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            // initialValue: 'Male',
                            allowClear: true,
                            hint: const Text('Select Branch'),
                            onChanged: (val) {
                              val = _branch;
                            },
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            items: branchOptions
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // Select Branch
                      Text(
                        'Select Event',
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FieldContainert(
                          field: FormBuilderDropdown(
                            name: 'event',
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            // initialValue: 'Male',
                            allowClear: true,
                            hint: const Text('Select Event'),
                            onChanged: (val) {
                              val = _events;
                            },
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            items: eventOptions
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Submit button
                      MyButton(
                          buttonName: 'Submit',
                          function: () {
                            Get.toNamed('/homeScreen');
                          })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
