import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_doctor/controllers/loading_controller.dart';
import 'package:flutter/material.dart';

import 'package:e_doctor/auth/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/color_pallete.dart';
import '../controllers/auth_controller.dart';
import '../widgets/radio_button.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_input.dart';
import '../widgets/rounded_password_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Create a CollectionReference called vehicleRequests that references the firestore collection
  CollectionReference requests = FirebaseFirestore.instance.collection('users');
  final formkey = GlobalKey<FormState>();
  bool? agree = false;
  bool patientSelected = false;
  bool doctorSelected = false;
  void followupSelected(bool selection, int sizeId) {
    if (sizeId == 1) {
      patientSelected = selection;
      doctorSelected = false;
    }
    if (sizeId == 2) {
      doctorSelected = selection;
      patientSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
        title: const Text(
          "Sign Up",
          textHeightBehavior: TextHeightBehavior(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(85))),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.09),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Select Role",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RadioButton(
                      label: "Patient",
                      textColor: patientSelected
                          ? const Color(0xffffffff)
                          : const Color.fromRGBO(52, 168, 83, 1),
                      backgroundColor: patientSelected
                          ? const Color(0xffffffff)
                          : Colors.white,
                      checkmarkColor: patientSelected
                          ? const Color(0xffffffff)
                          : const Color.fromRGBO(52, 168, 83, 1),
                      selected: patientSelected,
                      selectedColor: const Color.fromRGBO(52, 168, 83, 1),
                      onSelected: (bool value) {
                        setState(() {
                          followupSelected(value, 1);
                          if (value) {
                            patientSelected = true;
                          } else {
                            patientSelected = false;
                          }
                          if (patientSelected = true) {
                            authContrler.updateRole("patient");
                            print(authContrler.role);
                          }
                        });
                      }),
                  RadioButton(
                      label: "Doctor",
                      textColor: doctorSelected
                          ? const Color(0xffffffff)
                          : const Color.fromRGBO(52, 168, 83, 1),
                      backgroundColor: doctorSelected
                          ? const Color(0xffffffff)
                          : Colors.white,
                      checkmarkColor: doctorSelected
                          ? const Color(0xffffffff)
                          : const Color.fromRGBO(52, 168, 83, 1),
                      selected: doctorSelected,
                      selectedColor: const Color.fromRGBO(52, 168, 83, 1),
                      onSelected: (bool value) {
                        setState(() {
                          followupSelected(value, 2);
                          if (value) {
                            doctorSelected = true;
                          } else {
                            doctorSelected = false;
                          }
                          if (doctorSelected = true) {
                            authContrler.updateRole("doctor");
                            print(authContrler.role);
                          }
                        });
                      }),
                ],
              ),
              SizedBox(height: size.height * 0.09),
              RoundedInput(
                label: "UserName",
                hint: "UserName",
                icon: Icons.person,
                onChanged: (String value) {
                  setState(() {
                    authContrler.changeName(value);
                  });
                },
              ),
              RoundedInput(
                label: "Email Address",
                hint: "Email Address",
                icon: Icons.email,
                onChanged: (String value) {
                  setState(() {
                    authContrler.changeEmail(value);
                  });
                },
              ),
              RoundedPasswordField(
                onChanged: (String value) {
                  setState(() {
                    authContrler.changePass(value);
                  });
                },
                hintText: 'Password',
                label: 'Password',
              ),
              RoundedPasswordField(
                onChanged: (String value) {
                  setState(() {
                    authContrler.changeConfirmPass(value);
                  });
                },
                hintText: 'Confirm Password',
                label: 'Confirm Password',
              ),
              termsAndConditions(),
              GetBuilder<AuthController>(
                  init: AuthController(),
                  builder: (control) {
                    return RoundedButton(
                      text: "Sign Up",
                      press: () {
                        loaderController.changeProgress(
                            true, "Registering new user");
                        registration(control.role, control.name, control.email,
                            control.password);
                      },
                      color: Colors.green,
                    );
                  }),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account ? ",
                    style: TextStyle(fontSize: 14, color: kPrimaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.15),
            ],
          )),
        ),
      ),
    );
  }
  // upload user content

  Future<void> registration(
      String role, String name, String email, String password) {
    return requests.add({
      'role': role,
      'userName': name,
      'email': email,
      'password': password,
    }).then((value) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('userToken', value.id);
      print(value.id);
      loaderController.changeProgress(false, "Registered successfully");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration successfully")));
      // ignore: use_build_context_synchronously
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => const Login())),
          (route) => false);
    }).catchError((error) => ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Failed to register: $error"))));
  }

  Widget termsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(children: [
          SizedBox(
              width: 150,
              child: CheckboxListTile(
                  checkColor: Colors.green,
                  activeColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    "Agree with",
                    style: TextStyle(fontSize: 13),
                  ),
                  value: agree,
                  onChanged: (bool? value) {
                    setState(() {
                      agree = value;
                    });
                  })),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onTap: () {
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (context) => Container()),
                //     (route) => true);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
