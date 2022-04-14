import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../../theme_controller/theme/theme.dart';
import '../../universal_widgets/fieldContainer.dart';
import '../../universal_widgets/my_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // formkey
    final _formKey = GlobalKey<FormState>();

    // controllers
    final TextEditingController _companyId = TextEditingController();
    final TextEditingController _onboardingId = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              // bOX CONTAINING FORMS
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    children: [
                      // Logo
                      SizedBox(
                        height: 100,
                        width: 80,
                        child: Image.asset(
                          'assets/vms1.png',
                          // fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // forms start from
                      FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Company ID fields
                              FieldContainert(
                                field: TextFormField(
                                  controller: _companyId,
                                  decoration: InputDecoration(
                                    labelText: 'COMPANY ID',
                                    labelStyle: GoogleFonts.openSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  // autovalidateMode: AutovalidateMode.always,

                                  validator: FormBuilderValidators.compose([
                                    (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Please enter an Company ID';
                                      }
                                      return null;
                                    }
                                  ]),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Onboarding ID field
                              FieldContainert(
                                  field: TextFormField(
                                controller: _onboardingId,
                                decoration: InputDecoration(
                                  labelText: 'ONBOARDING ID',
                                  labelStyle: GoogleFonts.openSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  border: InputBorder.none,
                                ),
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
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 400,
                                child: MyButton(
                                  buttonName: 'Submit',
                                  function: () {
                                    // _formKey.currentState?.save();
                                    // if (_formKey.currentState!.validate()) {
                                    //   // print(_formKey.currentState.save());

                                    // } else {
                                    //   Get.snackbar(
                                    //       'Failed', 'Validation failed');
                                    // }
                                    Get.toNamed('/setupScreen');
                                  },
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
