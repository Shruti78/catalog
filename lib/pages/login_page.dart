import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  // ignore: non_constant_identifier_names
  bool ChangeButton = false;

  final _formkey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        ChangeButton = true;
      });

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        ChangeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/undraw_secure_login_pdn4.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10.0,
                ),
                // ignore: prefer_const_constructors
                Text(
                  "Welcome $name",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        enableInteractiveSelection:
                            false, // this is to solve problem  of error occuring while using virtual keyboard
                        cursorHeight: 0,
                        cursorWidth: 0,
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {
                            ChangeButton = true;
                          });
                        },
                      ),
                      TextFormField(
                        cursorHeight: 0,
                        cursorWidth: 0,
                        enableInteractiveSelection:
                            false, // this is to solve problem  of error occuring while using virtual keyboard
                        // due to this we cant see elements in our Drawer so it is enabled

                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password cannot be empty";
                          } else if (value.length < 6) {
                            return "password length is too short";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.purple,
                        borderRadius:
                            BorderRadius.circular(ChangeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () async => movetoHome(context),
                          child: AnimatedContainer(
                            // ignore: prefer_const_constructors
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: ChangeButton ? 50 : 150,
                            alignment: Alignment.center,
                            // ignore: sort_child_properties_last
                            child: ChangeButton
                                // ignore: prefer_const_constructors
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
