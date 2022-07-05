// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:manual_de_sobrevivencia/values/custom_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              CustomColors().getTopColor(),
              CustomColors().getButtomColor(),
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
                          TextField(
                            onChanged: (text) {
                              email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              labelText: 'Login',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            onChanged: (text) {
                              password = text;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
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
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (email == '' && password == '') {
                        //Navigator.of(context)
                        //   .pushReplacementNamed('/loginAuthenticate');
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
}
