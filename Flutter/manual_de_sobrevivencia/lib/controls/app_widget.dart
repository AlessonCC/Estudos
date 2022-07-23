import 'package:flutter/material.dart';
import 'package:manual_de_sobrevivencia/controls/splash.dart';
import 'package:manual_de_sobrevivencia/pages/screen/sing_up/register_page.dart';

import 'Screen_page.dart';
import '../pages/screen/home_page.dart';
import '../pages/screen/login/login_page.dart';
import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (animation, builder) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: Login().address,
          routes: {
            Login().address: (context) => const LoginPage(),
            '/registerPage': (context) => const RegisterPage(),
            '/loginAuthenticate': (context) => const Splash(),
            '/home': (context) => HomePage(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
