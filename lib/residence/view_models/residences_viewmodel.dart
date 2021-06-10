import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:vis_aquae/residence/device/device_residence_viewmodel.dart';
import 'package:vis_aquae/residence/device/device_viewmodel.dart';
import 'package:vis_aquae/residence/view_models/residence_viewmodel.dart';
import 'package:vis_aquae/shared/models/device.dart';
import 'package:vis_aquae/shared/models/device_residence.dart';
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

    _residences.forEach(
      (residence) async {
        try {
          final devicesList = await DbUtil.getDevicesResidence(residence.id);
          residence.dispositivos.addAll(
            devicesList.map(
              (device) => DeviceResidenceViewModel(
                DeviceViewModel(
                  Device(
                    device['id_dispositivo'],
                    device['nome'],
                    device['consumo'],
                  ),
                ),
                device['tempo_ligado'],
              ),
            ),
          );
        } catch (e) {
          developer.log(e.toString());
        }
      },
    );

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

    await DbUtil.insert('residencia', {
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

  Future<void> removeResidence(String id) async {
    _residences.removeWhere((element) => element.id == id);
    await DbUtil.remove('residencia', {
      'column': 'id_residencia',
      'id': id,
    });
    notifyListeners();
  }

  Future<void> addResidenceDevice(
    String idDispositivo,
    String idResidence,
    String tempoLigado,
  ) async {
    await DbUtil.insert('residencia_dispositivo', {
      'id_residencia': idResidence,
      'id_dispositivo': idDispositivo,
      'tempo_ligado': tempoLigado,
    });

    try {
      final devicesList = await DbUtil.getDevicesResidence(idResidence);
      _residences.firstWhere((element) => element.id == idResidence).setDispositivos =
          devicesList
              .map(
                (device) => DeviceResidence(
                  device['id_residencia'],
                  Device(
                    device['id_dispositivo'],
                    device['nome'],
                    device['consumo'],
                  ),
                  device['tempo_ligado'],
                ),
              )
              .toList();
    } catch (e) {
      developer.log(e.toString());
    }
    notifyListeners();
  }
}
