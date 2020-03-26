import 'dart:convert' as convert;
import 'package:autoa/model/carro.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  final String luxo= 'luxo';
  final String esportivo = 'esportivos';
  final String classicos= 'classicos';
}
class CarroApi {

  static Future<List<Carro>> getCarro(String tipo) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';
    var response = await http.get(url);

    List listResponse = convert.json.decode(response.body);
    final carros = listResponse.map<Carro>((map) => Carro.fromJson(map)).toList();

    return carros;
  }
}