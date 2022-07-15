// ignore_for_file: unused_import, file_names

import 'package:flutter/cupertino.dart';

abstract class Screen {
  String address = '';
}

class Login extends Screen {
  @override
  set address(String _address) {
    super.address = '/';
  }
}
