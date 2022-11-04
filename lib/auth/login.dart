// ignore_for_file: iterable_contains_unrelated_type

import 'package:e_doctor/controllers/loading_controller.dart';
import 'package:e_doctor/screens/patient%20screens/forgotpassword.dart';
import 'package:e_doctor/screens/patient%20screens/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_pallete.dart';
import '../controllers/auth_controller.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_input.dart';
import '../widgets/rounded_password_field.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authContrler.fetchUserContent();
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 150,
        elevation: 0,
        title: Wrap(
          direction: Axis.vertical,
          children: [
            SizedBox(height: size.height * 0.02),
            Icon(
              Icons.verified_user_rounded,
              size: size.height * 0.05,
              color: Colors.black,
            ),
            SizedBox(height: size.height * 0.05),
            const Text(
              "Log In",
              textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
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
              RoundedInput(
                label: "Email Address",
                hint: "Email Address",
                icon: Icons.email,
                onChanged: (String value) {
                  setState(() {
                    authContrler.changeLoginEmail(value);
                  });
                },
              ),
              RoundedPasswordField(
                onChanged: (String value) {
                  setState(() {
                    authContrler.changeLoginPassword(value);
                  });
                },
                hintText: 'Password',
                label: 'Password',
              ),
              forgotYourPasswordUI(),
              GetBuilder<AuthController>(
                  init: AuthController(),
                  builder: (control) {
                    return RoundedButton(
                      text: "LOGIN",
                      press: () {
                        if (formkey.currentState!.validate()) {
                          if (control.userProfile.isNotEmpty) {
                            for (var user in control.userProfile) {
                              if (user.email == control.logInEmail &&
                                  user.password == control.logInPassword) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => Index(),
                                    ),
                                    (route) => false);
                              } else {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                    (route) => false);
                                loaderController.showErrorMsg(
                                    "User Credential don't match");
                              }
                            }
                          } else {
                            loaderController.showErrorMsg("User Object empty");
                          }
                        }
                      },
                      color: Colors.green,
                    );
                  }),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have an account ? ",
                    style: TextStyle(fontSize: 14, color: kPrimaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      "Sign Up",
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

  Widget forgotYourPasswordUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()),
                  (route) => true);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Forgot yourPassword?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
