import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:vis_aquae/shared/models/residence.dart';
import 'package:vis_aquae/shared/utils/db_util.dart';

class ResidenceViewModel with ChangeNotifier {
  List<Residence> _residences = [];

  List<Residence> get residences => [..._residences];

  int get residencesCount => _residences.length;

  Residence residenceByIndex(int index) => _residences[index];

  Future<void> loadResidences() async {
    final dataList = await DbUtil.getData('residencia');

    _residences = dataList
        .map(
          (residence) => Residence(
            residence['id_residencia'],
            residence['nome'],
            residence['qtd_moradores'],
            residence['cep'],
            residence['pais'],
            residence['estado'],
            residence['cidade'],
            residence['bairro'],
            residence['rua'],
            residence['numero'],
            residence['complemento'],
          ),
        )
        .toList();

    notifyListeners();
  }

  Future<void> addResidence(
      String nome,
      int qtdMoradores,
      String cep,
      String pais,
      String estado,
      String cidade,
      String bairro,
      String rua,
      String numero,
      String complemento) async {
    final newResidence = Residence(
      Random().nextDouble().toString(),
      nome,
      qtdMoradores,
      cep,
      pais,
      estado,
      cidade,
      bairro,
      rua,
      numero,
      complemento,
    );

    _residences.add(newResidence);

    DbUtil.insert('residencia', {
      'id_residencia': newResidence.id,
      'nome': newResidence.nome,
      'qtd_moradores': newResidence.qtdMoradores,
      'pais': newResidence.pais,
      'estado': newResidence.estado,
      'cidade': newResidence.cidade,
      'bairro': newResidence.bairro,
      'rua': newResidence.rua,
      'numero': newResidence.numero,
      'complemento': newResidence.complemento,
      'cep': newResidence.cep,
    });

    notifyListeners();
  }
}
