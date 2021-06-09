import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:vis_aquae/residence/view_models/residence_viewmodel.dart';
import 'package:vis_aquae/shared/models/residence.dart';
import 'package:vis_aquae/shared/utils/db_util.dart';

class ResidencesViewModel with ChangeNotifier {
  List<ResidenceViewModel> _residences = [];

  List<ResidenceViewModel> get residences => [..._residences];

  int get residencesCount => _residences.length;

  ResidenceViewModel residenceByIndex(int index) => _residences[index];

  Future<void> loadResidences() async {
    final dataList = await DbUtil.getData('residencia');

    _residences = dataList
        .map(
          (residence) => ResidenceViewModel(
            Residence(
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
    final newResidence = ResidenceViewModel(
      Residence(
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
      ),
    );

    _residences.add(newResidence);

    DbUtil.insert('residencia', {
      'id_residencia': newResidence.residence.id,
      'nome': newResidence.residence.nome,
      'qtd_moradores': newResidence.residence.qtdMoradores,
      'pais': newResidence.residence.pais,
      'estado': newResidence.residence.estado,
      'cidade': newResidence.residence.cidade,
      'bairro': newResidence.residence.bairro,
      'rua': newResidence.residence.rua,
      'numero': newResidence.residence.numero,
      'complemento': newResidence.residence.complemento,
      'cep': newResidence.residence.cep,
    });

    notifyListeners();
  }

  Future<void> removeResidence(String id) async {
    _residences.removeWhere((element) => element.id == id);
    DbUtil.removeResidence(id);
    notifyListeners();
  }
}
