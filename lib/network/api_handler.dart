import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:quotey/models/quote.dart';

class Network {
  Future fetchData() async {
    var url = Uri.parse("https://api.quotable.io/random");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Quote.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
