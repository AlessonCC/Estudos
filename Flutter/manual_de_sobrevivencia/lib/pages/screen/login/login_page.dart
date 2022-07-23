// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manual_de_sobrevivencia/pages/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/models/login_model.dart';
import '../../../shared/constants/custom_colors.dart';
import '../../../shared/constants/preferences_keys.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  String email = '';
  String password = '';
  // ignore: non_constant_identifier_names
  bool _ObscurePassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientTopColor(),
              CustomColors().getGradientButtomColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/IfsLogo.jpeg'),
                  ),
                  Container(height: 50),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: ((value) {
                              if (value == null ||
                                  value.length < 5 ||
                                  value.isEmpty) {
                                return "E-mail Inválido!";
                              } else if (!value.contains("@")) {
                                return "E-mail Inválido!";
                              } else if (!value.contains(".")) {
                                return "E-mail Inválido!";
                              }
                              return null;
                            }),
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
                          const SizedBox(height: 5),
                          TextFormField(
                            validator: ((value) {
                              if (value == null ||
                                  value.length < 8 ||
                                  value.isEmpty) {
                                return "E-mail ou Senha Incorretos!";
                              }
                            }),
                            obscureText: !_ObscurePassword,
                            controller: _passwordInputController,
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
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 7),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _ObscurePassword,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _ObscurePassword = newValue!;
                          });
                        },
                      ),
                      const Text("Show Password?"),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      _doLogin();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    color: CustomColors().getActivePrimaryButtonColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Do not have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/registerPage');
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    color: CustomColors().getActiveSecondButton(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    if (_formKey.currentState?.validate() == true) {
      LoginService().login(
        _mailInputController.text,
        _passwordInputController.text,
      );
      loginUser();
    } else {
      print("invalido");
    }
  }

  Future<void> loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _mailInputController.text,
          password: _passwordInputController.text);
      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        Navigator.of(context).pushReplacementNamed('/loginAuthenticate');
      } else {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('This is a demo alert dialog.'),
                    Text('Would you like to approve of this message?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // void _doLogin() async {
  //   String mailForm = _mailInputController.text;
  //   String passwordForm = _passwordInputController.text;

  //  LoginModel savedUser = await _getSavedUser();
  //   if (mailForm == savedUser.mail && passwordForm == savedUser.password) {
  //    print("Login Efetuado Com Sucesso!");
  //    Navigator.of(context).pushReplacementNamed('/loginAuthenticate');
  // } else {
  //    print("Login ou Senha Incorretos");
  //   }
  // }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonUser = preferences.getString(PreferencesKeys.activeUser);

    Map<String, dynamic> mapUser = jsonDecode(jsonUser!);
    LoginModel user = LoginModel.fromJson(mapUser);

    return user;
  }
}
