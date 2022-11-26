import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final _postDataUrl =
      Uri.parse("http://mybeauticianapp.in/app/profile_update.php");

  Future<void> signUpUser(Map<String, dynamic> userData) async {
    var response = await http.post(_postDataUrl, body: userData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  // for getting data \

  final _getDataUrl = Uri.parse("http://mybeauticianapp.in/app/get-category.php");

  Future<dynamic> getData() async {
    var response = await http.get(_getDataUrl);

    print('Response status: ${response.statusCode}');
    print('Response body: ${jsonDecode(response.body)["results"]}');

    return jsonDecode(response.body)["results"];
  }
}
