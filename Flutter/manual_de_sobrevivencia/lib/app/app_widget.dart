import 'package:flutter/material.dart';
import 'package:manual_de_sobrevivencia/app/login_page.dart';
import 'package:manual_de_sobrevivencia/app/splash.dart';

import 'app_controller.dart';
import 'home_page.dart';

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
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/loginAuthenticate': (context) => const Splash(),
            '/home': (context) => HomePage(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
