import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    _checkAuth()
        .then((value) => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: Image.asset('assets/images/IfsLogo.jpeg'),
            ),
            Container(
              height: 20,
            ),
            CircularProgressIndicator(),
            Container(
              height: 10,
            ),
            Text('Loading...')
          ],
        ),
      ),
    );
  }

  Future<void> _checkAuth() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
