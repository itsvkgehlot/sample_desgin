import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_desgin/Registration_Page.dart';

import 'branch_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  late int generatedOTP;
  bool showError = false;
  bool numberDisable = true;
  bool otpDisable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/images/Background.png',
                  height: 845,
                  width: 420,
                  fit: BoxFit.cover,
                ),
              ),
              // Logo
              Positioned(
                top: MediaQuery.of(context).size.height * 0.14,
                left: MediaQuery.of(context).size.width * 0.21,
                child: Image.asset(
                  'assets/images/logo1.png',
                  height: 150,
                  width: 200,
                ),
              ),
              // Login Text
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left: MediaQuery.of(context).size.width * 0.05,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Mobile Number Field
              Positioned(
                top: MediaQuery.of(context).size.height * 0.48,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: TextFormField(
                  controller: numberController,
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  enabled: numberDisable,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(
                        Icons.phone_android_outlined,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    counterText: "",
                    hintText: 'Mobile Number',
                    contentPadding: const EdgeInsets.only(right: 0, top: 20),
                    errorText:
                        showError ? 'Please enter a valid mobile number' : null,
                  ),
                  keyboardType: TextInputType.phone,
                 /* validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    } else if (value.length != 10) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },*/
                ),
              ),
              // Send OTP Button
              // Send OTP Button
              Positioned(
                top: MediaQuery.of(context).size.height * 0.48,
                right: MediaQuery.of(context).size.width * 0.05,
                child: SizedBox(
                  width: 100, // Adjust the width as needed
                  child: ElevatedButton(
                    onPressed: () {
                      if (numberDisable) {
                        if (numberController.text.isEmpty) {
                          // Show error message for empty mobile number field
                          setState(() {
                            showError = true;
                          });
                          Fluttertoast.showToast(
                            msg: 'Enter the number',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        } else if (numberController.text.length != 10) {
                          numberController.clear();
                          // Show error message for invalid mobile number length
                          setState(() {
                            showError = true;
                          });
                          Fluttertoast.showToast(
                            msg: 'Enter a valid number',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        } else {
                          // Generate OTP and show it using a Toast message
                          generatedOTP = generateOTP();
                          Fluttertoast.showToast(
                            msg: 'Generated OTP: $generatedOTP',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                          setState(() {
                            showError = false;
                            numberDisable = false;
                            otpDisable = true;
                            otpController.text = generatedOTP.toString();
                          });
                        }
                      } else {
                        // Edit button clicked
                        numberController.clear();
                        otpController.clear();
                        setState(() {
                          numberDisable = true;
                          otpDisable = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0), // Remove padding
                      backgroundColor : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          numberDisable ? 'Send OTP' : ' Edit  ',
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(width: 5), // Add spacing between text and icon
                        Icon(
                          numberDisable ? Icons.send : Icons.edit,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // OTP Field
              Positioned(
                top: MediaQuery.of(context).size.height * 0.55,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: TextFormField(
                  controller: otpController,
                  enabled: otpDisable,
                  maxLength: 4,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    counterText: " ",
                    hintText: 'OTP',
                    contentPadding: const EdgeInsets.only(right: 0, top: 20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Image.asset(
                        'assets/images/Vector.png',
                        scale: 2,
                      ),
                    ),
                    errorText: showError ? 'Please enter a valid OTP' :  null),
                  ),
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the OTP';
                    } else if (value != generatedOTP.toString()) {
                      return 'Invalid OTP';
                    }
                    return null;
                  },*/

              ),
              // Login Button
              Positioned(
                top: MediaQuery.of(context).size.height * 0.68,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: ElevatedButton(
                  onPressed: ()  {
                    if (numberController.text.isEmpty &&
                        otpController.text.isEmpty) {
                      numberController.clear();
                      otpController.clear();
                      // Show error message for empty fields
                      Fluttertoast.showToast(
                        msg: 'Enter the number and OTP',
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      setState(() {
                        showError = true;
                      });
                    } else if (numberController.text.isEmpty) {
                      // Show error message for empty number field
                      Fluttertoast.showToast(
                        msg: 'Enter your mobile number',
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      setState(() {
                        showError = true;
                      });
                    } else if (otpController.text.isEmpty) {
                      // Show error message for empty OTP field
                      Fluttertoast.showToast(
                        msg: 'Enter the OTP',
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      setState(() {
                        showError = true;
                      });
                    } else if (numberController.text.length != 10) {
                      numberController.clear();
                      // Show error message for invalid mobile number length
                      Fluttertoast.showToast(
                        msg: 'Enter a valid number',
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      setState(() {
                        showError = true;
                      });
                    } else if (otpController.text == generatedOTP.toString()) {
                      // Show success message for correct OTP
                      Fluttertoast.showToast(
                        msg: 'Login Successful',
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BranchPage(),
                        ),
                      );
                      setState(() {
                        showError = false;
                        numberDisable = true;
                        otpDisable = false;
                      });
                      numberController.clear();
                      otpController.clear();
                    } else {
                      // Show error message for incorrect OTP
                      otpController.clear();
                      Fluttertoast.showToast(
                        msg: 'Invalid OTP',
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      setState(() {
                        showError = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Login'),
                ),
              ),
              // Register Text
              Positioned(
                top: MediaQuery.of(context).size.height * 0.75,
                left: MediaQuery.of(context).size.width * 0.20,
                right: MediaQuery.of(context).size.width * 0.20,
                child: RichText(
                  text: TextSpan(
                    text: "Don't Have an Account? ",
                    style: const TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: const TextStyle(
                          color: Colors.orange,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int generateOTP() {
    // Generate a 6-digit OTP
    Random random = Random();
    return random.nextInt(9999) + 1000;
  }
}
