import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class QuotesAPI {
  static Future getQuotes() async {
    final String url = 'https://api.kanye.rest';
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return convert.json.decode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
