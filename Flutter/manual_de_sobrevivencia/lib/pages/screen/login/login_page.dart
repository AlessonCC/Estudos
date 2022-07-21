// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/models/login_model.dart';
import '../../../shared/values/custom_colors.dart';
import '../../../shared/values/preferences_keys.dart';

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
  bool ContinueConnected = false;

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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
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
                          const SizedBox(height: 5),
                          TextFormField(
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
                    onTap: () {
                      print('Clicou');
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: ContinueConnected,
                        onChanged: (bool? newValue) {
                          setState(() {
                            ContinueConnected = newValue!;
                          });
                        },
                      ),
                      const Text("Continue Connected?"),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      _doLogin();
                      if (email == '' && password == '') {
                        Navigator.of(context)
                            .pushReplacementNamed('/loginAuthenticate');
                      } else {
                        ListView(children: [
                          Container(height: 10),
                          const Text('Insert Text'),
                        ]);
                      }
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
                      if (email == '' && password == '') {
                        Navigator.of(context)
                            .pushReplacementNamed('/registerPage');
                      } else {
                        ListView(children: [
                          Container(height: 10),
                          const Text('Insert Text'),
                        ]);
                      }
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
    String mailForm = _mailInputController.text;
    String passwordForm = _passwordInputController.text;

    LoginModel savedUser = await _getSavedUser();
    if (mailForm == savedUser.mail && passwordForm == savedUser.password) {
      print("Login Efetuado Com Sucesso!");
      Navigator.of(context).pushReplacementNamed('/loginAuthenticate');
    } else {
      print("Login ou Senha Incorretos");
    }
  }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonUser = preferences.getString(PreferencesKeys.activeUser);

    Map<String, dynamic> mapUser = jsonDecode(jsonUser!);
    LoginModel user = LoginModel.fromJson(mapUser);

    return user;
  }
}
