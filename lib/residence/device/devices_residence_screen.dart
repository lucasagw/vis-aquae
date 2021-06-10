import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/device/device_residence_viewmodel.dart';
import 'package:vis_aquae/shared/widgets/app_bar_arrow_back.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';
import 'package:vis_aquae/without_items/without_itens_screen.dart';

class DevicesResidenceScreen extends StatefulWidget {
  const DevicesResidenceScreen({Key key}) : super(key: key);

  @override
  _DevicesResidenceScreenState createState() => _DevicesResidenceScreenState();
}

class _DevicesResidenceScreenState extends State<DevicesResidenceScreen> {
  List<DeviceResidenceViewModel> devices;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    devices = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return devices == null || devices.isEmpty
        ? WithoutItensScreen(text: 'NENHUM DISPOSITIVO CADASTRADO')
        : Scaffold(
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: AppColors.backgroundScreen,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBarArrowBack(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ContainerTitle(title: 'Dispositivos'),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 425,
                          child: ListView.builder(
                            itemCount: devices.length,
                            itemBuilder: (context, index) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      devices[index].deviceViewModel.nome,
                                      style: TextStyle(fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Divider(color: Colors.black38),
                                    Text(
                                      'Tempo Ligado:\n${devices[index].tempoLigado}',
                                    ),
                                    Divider(color: Colors.black38),
                                    Text(
                                      'Consumo:\n${devices[index].deviceViewModel.consumo}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AppLogo(),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
