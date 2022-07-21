import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:manual_de_sobrevivencia/shared/constants/routes.dart';

class SingUpService {
  singUp(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signUp()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );

    print(response.body);
  }
}
