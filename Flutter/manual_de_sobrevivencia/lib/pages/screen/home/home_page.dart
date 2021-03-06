import 'package:flutter/material.dart';
import 'package:manual_de_sobrevivencia/pages/screen/home/home_widgets/home_appbar.dart';

import '../../../controls/app_controller.dart';
import '../../../controls/Screen_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('assets/images/NonUser.jpg'),
                ),
                accountName: const Text('Login User'),
                accountEmail: const Text('Email User')),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              subtitle: const Text('Pagina Inicial'),
              onTap: () {
                // ignore: avoid_print
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              subtitle: const Text('Configurações'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('Finalizar Sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Login().address);
              },
            ),
            ListTile(
                leading: CustomSwitch(),
                title: Text('Dark Mode'),
                subtitle: Text('Modo Noturno'),
                onTap: () {}),
          ],
        ),
      ),
      appBar: getHomeAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start
          children: [
            Text('Contador $count'),
            Container(height: 10),
            const Text('Insert Text'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.red)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
