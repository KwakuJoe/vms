import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/universal_widgets/fieldContainer.dart';
import 'package:vms/universal_widgets/my_button.dart';

import '../../universal_widgets/my_navbar.dart';

class CheckInFormsPage extends StatefulWidget {
  const CheckInFormsPage({Key? key}) : super(key: key);

  @override
  State<CheckInFormsPage> createState() => _CheckInFormsPageState();
}

class _CheckInFormsPageState extends State<CheckInFormsPage> {
  final _formKey = GlobalKey<FormState>();

  // Branch options
  var categoryOptions = ['Customer Compliance', 'Customer product check'];
  var genderOptions = ['Male', 'Femal'];

  @override
  Widget build(BuildContext context) {
    // controllers
    final TextEditingController _phoneNumber = TextEditingController();
    final TextEditingController _fullName = TextEditingController();
    final TextEditingController _purpose = TextEditingController();
    const String _gender = "";
    const String _category = "";

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
                          'Check In',
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
                            'Check In Forms',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Forms Begin here

                      // country
                      Text(
                        'Phone Number',
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
                              controller: _fullName,
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
                            child: FieldContainert(
                                field: TextFormField(
                              controller: _phoneNumber,
                              // controller: _onboardingId,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Phone Number'),
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
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // Full name
                      Text(
                        'Full Name',
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FieldContainert(
                          field: TextFormField(
                            controller: _phoneNumber,
                            // controller: _onboardingId,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Full Name'),
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
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // Select Gender
                      Text(
                        'Gender',
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FieldContainert(
                          field: FormBuilderDropdown(
                            name: 'gender',
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            initialValue: 'Male',
                            allowClear: true,
                            hint: const Text('Select Gender'),
                            onChanged: (val) {
                              val = _gender;
                            },
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            items: genderOptions
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
                      // Select Category
                      Text(
                        'Category',
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Category
                      SizedBox(
                        width: double.infinity,
                        child: FieldContainert(
                          field: FormBuilderDropdown(
                            name: 'category',
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            // initialValue: 'Male',
                            allowClear: true,
                            hint: const Text('Select Category'),
                            onChanged: (val) {
                              val = _category;
                            },
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            items: categoryOptions
                                .map((category) => DropdownMenuItem(
                                      value: category,
                                      child: Text(category),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Purpose
                      Text(
                        'Purpose',
                        style: GoogleFonts.openSans(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FieldContainert(
                          field: TextFormField(
                            controller: _purpose,
                            maxLines: 3,
                            // controller: _onboardingId,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Types purpose here ..'),
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
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Submit button
                      MyButton(
                          buttonName: 'Submit',
                          function: () {
                            // Snack Bar
                            Get.snackbar('Token Sent Successfully',
                                'Token has been sent to this number +233 5544454433, verify token',
                                colorText: Colors.green,
                                backgroundColor: Colors.white,
                                duration: const Duration(seconds: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                icon: const CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ));

                            // Next to verification
                            Get.toNamed('/checkInCodeVerificationPage');
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
