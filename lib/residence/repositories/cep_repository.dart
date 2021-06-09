import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vis_aquae/shared/models/cep.dart';

class CepRepository {
  Future<Cep> getCep(String cep) async {
    Cep cepModel;
    try {
      final response = await http.get(
        Uri.parse('https://viacep.com.br/ws/$cep/json/'),
      );
      cepModel = Cep.fromJson(json.decode(response.body));
    } catch (e) {
      log('ERRO NO GET CEP: $e');
      throw HttpException(
        'Ocorreu um erro ao obter os dados do cep informado.',
      );
    }
    return cepModel;
  }
}
