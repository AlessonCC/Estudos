// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/models/userModels.dart';
import '../../../shared/values/custom_colors.dart';
import '../../../shared/values/preferences_keys.dart';
import '../Screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmPasswordInputController =
      TextEditingController();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 70,
          horizontal: 50,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientButtomColor(),
              CustomColors().getGradientTopColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Register"),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      autofocus: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _mailInputController,
                      autofocus: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      obscureText: (_showPassword == true) ? false : true,
                      autofocus: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _confirmPasswordInputController,
                      obscureText: (_showPassword == true) ? false : true,
                      autofocus: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: "Confirme Password",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _showPassword,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _showPassword = newValue!;
                            });
                          },
                        ),
                        const Text("Show Password?"),
                      ],
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _doSingUp();
                  Navigator.of(context).pushReplacementNamed(Login().address);
                },
                child: const Text("Register Now!"),
                color: CustomColors().getActiveSecondButton(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doSingUp() {
    User newUser = User(
      name: _nameInputController.text,
      mail: _mailInputController.text,
      password: _passwordInputController.text,
      keepOn: true,
    );
    // ignore: avoid_print
    print(newUser);
    _saveUser(newUser);
  }

  void _saveUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
}
