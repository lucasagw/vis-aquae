import 'package:flutter/widgets.dart';
import 'package:vis_aquae/residence/device/device_viewmodel.dart';
import 'package:vis_aquae/shared/models/device.dart';
import 'package:vis_aquae/shared/utils/db_util.dart';

class DevicesViewModels with ChangeNotifier {
  List<DeviceViewModel> _devices = [];

  int get devicesCount => _devices.length;

  List<DeviceViewModel> get devices => [..._devices];

  DeviceViewModel deviceByIndex(int index) => _devices[index];

  Future<void> loadDevices() async {
    final dataList = await DbUtil.getData('dispositivo');
    _devices = dataList
        .map(
          (device) => DeviceViewModel(
            Device(
              device['id_dispositivo'],
              device['nome'],
              device['consumo'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
