import 'package:vis_aquae/residence/device/device_residence_viewmodel.dart';
import 'package:vis_aquae/residence/device/device_viewmodel.dart';
import 'package:vis_aquae/shared/models/device_residence.dart';
import 'package:vis_aquae/shared/models/residence.dart';

class ResidenceViewModel {
  final Residence _residence;

  String get id => _residence.id;
  String get nome => _residence.nome;
  int get qtdMoradores => _residence.qtdMoradores;
  String get cep => _residence.cep;
  String get pais => _residence.pais;
  String get estado => _residence.estado;
  String get cidade => _residence.cidade;
  String get bairro => _residence.bairro;
  String get rua => _residence.rua;
  String get numero => _residence.numero;
  String get complemento => _residence.complemento;
  List<DeviceResidenceViewModel> get dispositivos => _residence.dispositivos
      .map((deviceResidence) => DeviceResidenceViewModel(
            DeviceViewModel(deviceResidence.device),
            deviceResidence.tempoLigado,
          ))
      .toList();

  set setDispositivos(List<DeviceResidence> dispositivos) {
    _residence.dispositivos = dispositivos;
  }

  ResidenceViewModel(this._residence);
}
