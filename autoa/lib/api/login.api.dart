import 'dart:convert';
import 'package:autoa/api/response.api.dart';
import 'package:autoa/model/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(login, senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map params = {
        'username': login,
        'password': senha,
      };

      Map<String, String> headers = {'Content-Type': 'application/json'};

      String s = json.encode(params);

      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        return ApiResponse.ok(user);
      }
      return ApiResponse.notOk(mapResponse['error']);
    } catch (exception) {
      print("Erro ao fazer login");
      return ApiResponse.notOk('Erro de servidor ou internet');
    }
  }
}
