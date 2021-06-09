import 'dart:convert';

import 'package:http/http.dart' as http;

class ResidenceRepository {
  Future<Map<String, dynamic>> getCep(String cep) async {
    try {
      final response = await http.get(
        Uri.parse('https://viacep.com.br/ws/$cep/json/'),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {}
  }
}
