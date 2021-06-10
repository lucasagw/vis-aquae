import 'package:vis_aquae/shared/models/device.dart';

class DeviceViewModel {
  final Device _device;
  String get id => _device.id;
  String get nome => _device.nome;
  double get consumo => _device.consumo;

  DeviceViewModel(this._device);
}
