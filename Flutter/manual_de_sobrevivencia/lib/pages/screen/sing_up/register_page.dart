// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manual_de_sobrevivencia/controls/Screen_page.dart';
import 'package:manual_de_sobrevivencia/pages/screen/login/login_page.dart';
import 'package:manual_de_sobrevivencia/pages/screen/sing_up/sing_up_service.dart';
import 'package:manual_de_sobrevivencia/shared/constants/custom_colors.dart';
import 'package:manual_de_sobrevivencia/shared/constants/preferences_keys.dart';
import 'package:manual_de_sobrevivencia/shared/models/login_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, Login().address);
        return true;
      },
      child: Scaffold(
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
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return "Digite um nome maior";
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 5) {
                            return "Esse e-mail parece curto demais";
                          } else if (!value.contains("@")) {
                            return "Esse e-mail está meio estranho, não?";
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return "A senha deve ter pelo menos 6 caracteres";
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value != _passwordInputController.text) {
                            return "As senhas devem ser iguais";
                          }
                          return null;
                        },
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
                    _doSignUp();
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
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState?.validate() == true) {
      SingUpService().singUp(
        _mailInputController.text,
        _passwordInputController.text,
      );
      Navigator.of(context).pushReplacementNamed(Login().address);
    } else {
      print("invalido");
    }

    // void _doSingUp() {
    //   LoginModel newUser = LoginModel(
    //     name: _nameInputController.text,
    //     mail: _mailInputController.text,
    //     password: _passwordInputController.text,
    //     keepOn: true,
    //  );
    // ignore: avoid_print
    //  print(newUser);
//    _saveUser(newUser);
    // }

    void _saveUser(LoginModel user) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(
        PreferencesKeys.activeUser,
        json.encode(user.toJson()),
      );
    }
  }
}
