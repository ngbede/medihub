import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:medihub/services/apikey/key.dart';

class Network {
  // make request to get Json file
  static Future<dynamic> getJson(Map<String, String> queryString) async {
    try {
      var uri = Uri.https(
          "priaid-symptom-checker-v1.p.rapidapi.com", "/symptoms", queryString);
      var response = await http.get(
        uri,
        headers: {
          'x-rapidapi-key': ApiKey.key,
          'x-rapidapi-host': 'priaid-symptom-checker-v1.p.rapidapi.com'
        },
      );
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var json = convert.jsonDecode(response.body);
          return json;
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
