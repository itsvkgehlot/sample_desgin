import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Login_Page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  int count = 0;
  bool showError = false;

  void register() {
    setState(() {
      showError = true;

    });

    if (_formKey.currentState!.validate()) {
      Future.delayed(const Duration(seconds: 1), () {
      if (count == 0) {
        Fluttertoast.showToast(msg: "Registration Successful");
          print("Navigating to LoginPage");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );

      } else {
        Fluttertoast.showToast(msg: "Fill correct details");
        count = 0;
      }
      },
      );

    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      count++;
      return 'Please enter your name';
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      count++;
      return 'Please enter your mobile number';
    }else if (value.length < 10) {
      count++;
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      count++;
      return 'Please enter your email';
    }else if (!value.contains('@')) {
      count++;
      return 'Please enter a valid email';
    }
    return null;
  }


  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      count++;
      return 'Please enter your password';
    }
    else if (value.length < 4) {
      count++;
      return 'Password should be at least 5 characters long';

    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      count++;
      return 'Please enter confirm password';
    }
    else if (value != passwordController.text) {
      count++;
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.14,
                left: MediaQuery.of(context).size.width * 0.21,
                child: Image.asset(
                  'assets/images/logo1.png',
                  height: 150,
                  width: 200,
                ),
              ),
              Positioned(
                top: 245,
                left: 20,
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //name
              Positioned(
                top: 290,
                left: 20,
                right: 20,
                child: TextFormField(
                  maxLines: 1,
                  maxLength: 25,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z ]"))],
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.only(right: 0, top: 20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    hintText: "Name",
                    errorText: showError ? validateName(nameController.text) : null,
                  ),
                ),
              ),
              //Mobile number
              Positioned(
                top: 340,
                left: 20,
                right: 20,
                child: TextFormField(
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.only(right: 0, top: 20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 4, top: 20),
                      child: Icon(
                        Icons.phone_iphone,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    hintText: "Mobile No",
                    errorText: showError ? validateNumber(numberController.text) : null,
                  ),
                ),
              ),
              //Email
              Positioned(
                top: 390,
                left: 20,
                right: 20,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLength: 35,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: 0, top: 20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    counterText: "",
                    hintText: "Email",
                    errorText: showError ? validateEmail(emailController.text) : null,
                  ),
                ),
              ),
              //Password
              Positioned(
                top: 440,
                left: 20,
                right: 20,
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  maxLength: 8,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    counterText: "",
                    isCollapsed: true,
                    contentPadding: EdgeInsets.only(right: 0, top: 20, bottom: 4),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    hintText: "Password",
                    errorText: showError ? validatePassword(passwordController.text) : null,
                  ),
                ),
              ),
              //Confirm Password
              Positioned(
                top: 490,
                left: 20,
                right: 20,
                child: TextFormField(
                  obscureText: true,
                  controller: cPasswordController,
                  maxLength: 8,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    counterText: " ",
                    contentPadding: EdgeInsets.only(right: 0, top: 20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    hintText: "Confirm Password",
                    errorText: showError ? validateConfirmPassword(cPasswordController.text) : null,
                  ),
                ),
              ),
              //Submit Button

              Positioned(
                top: 570,
                left: 20,
                right: 20,

                child: ElevatedButton(
                    onPressed: () {
                     register();
                    },
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Submit'),
                ),
              ),
              //To jump Login Page
              Positioned(
                top: 620,
                left: 90,
                right: 90,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Have Account ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: Colors.orange,

                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
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
}
